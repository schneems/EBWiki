class AddSlugToCalendarEvents < ActiveRecord::Migration
  def change
    add_column :calendar_events, :slug, :string
  end
end
