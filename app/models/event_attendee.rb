class EventAttendee < ActiveRecord::Base
  # Event reference
  belongs_to :attended_event, class_name: "Event", foreign_key: :event_id

  # User reference
  belongs_to :attendee, class_name: "User", foreign_key: :user_id
end
