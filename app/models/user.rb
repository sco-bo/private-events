class User < ActiveRecord::Base
  attr_accessor :token
  before_create :remember 
  has_many :events

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.token = User.new_token
    self.remember_token = Digest::SHA1.hexdigest(token)
  end

  def authenticated?(given_token)
    BCrypt::Password.new(remember_token).is_password?(given_token)
  end

  def forget
    update_attribute(:remember_token, nil)
  end
end
