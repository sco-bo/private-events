class AddUserToEventAttendees < ActiveRecord::Migration
  def change
    add_reference :event_attendees, :user, index: true, foreign_key: true
  end
end
