class CalendarEvent < ActiveRecord::Base
  validates :title, presence: true

  has_many :comments, as: :commentable

  attr_accessor :date_range

  EVENT_COLORS = { "Litigation Event" => "teal", "March" => "orange", "Vigil" => "olive" }


  EVENT_TEXT_COLORS = { "Litigation Event" => "dark green", "March" => "brown", "Vigil" => "white"}

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  def color
  	unless self.event_type.blank?
	  EVENT_COLORS[self.event_type]
	else
	  "#ccc"
	end
  end

  def text_color
  	unless self.event_type.blank?
	  EVENT_TEXT_COLORS[self.event_type]
	else
	  "#000000"
	end
  end
end
