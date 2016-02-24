class User < ActiveRecord::Base
  attr_accessor :token
  before_create :remember 
  has_many :events
  has_many :event_attendees
  has_many :attended_events, :through => :event_attendees, foreign_key: :user_id

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

  def upcoming_events
    self.attended_events.where("date >= ?", Date.today)
  end

  def previous_events
    self.attended_events.where("date <= ?", Date.today)
  end

  def forget
    update_attribute(:remember_token, nil)
  end
end
