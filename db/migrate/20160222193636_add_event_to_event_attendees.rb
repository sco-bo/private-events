class AddEventToEventAttendees < ActiveRecord::Migration
  def change
    add_reference :event_attendees, :event, index: true, foreign_key: true
  end
end
