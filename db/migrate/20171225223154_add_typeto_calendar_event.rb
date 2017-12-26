class AddTypetoCalendarEvent < ActiveRecord::Migration
  def change
    add_column :calendar_events, :event_type, :string
  end
end
