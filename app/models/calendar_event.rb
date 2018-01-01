class CalendarEvent < ActiveRecord::Base
  validates :title, presence: { message: 'Please specify a title' }
  validates :start_time, presence: { message: 'Please add a start time.' }
  validates :end_time, presence: { message: 'Please add an end time.' }
  validates :city, presence: { message: 'Please add a city.' }
  validates :state_id, presence: { message: 'Please specify the state where this incident occurred before saving.' }

  has_many :comments, as: :commentable
  belongs_to :user

  attr_accessor :date_range

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  EVENT_COLORS = { "Litigation Event" => "teal", "March" => "orange", "Vigil" => "olive" }


  EVENT_TEXT_COLORS = { "Litigation Event" => "dark green", "March" => "brown", "Vigil" => "white"}

  # Geocoding
  geocoded_by :full_address
  before_save :geocode, if: proc { |art|
    art.address_changed? || art.city_changed? || art.state_id_changed? || art.zipcode_changed?
  } # auto-fetch coordinates

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  def full_address
    "#{address} #{city} #{State.find(state_id).ansi_code} #{zipcode}".strip
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

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :title,
      %i[title city]
    ]
  end
end
