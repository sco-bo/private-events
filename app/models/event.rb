class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: :user_id
  has_many :attendees, :through => :event_attendees, foreign_key: :event_id
  has_many :event_attendees

  scope :upcoming, -> { where('date >= ?', Date.today) }
  scope :past, -> { where('date <= ?', Date.today) }
end
