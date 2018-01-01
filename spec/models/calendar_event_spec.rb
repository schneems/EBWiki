require 'rails_helper'

RSpec.describe CalendarEvent, type: :model do

  describe "validity" do
    it 'is invalid without a title' do
      calendar_event = build(:calendar_event, title: nil)
      expect(calendar_event).to be_invalid
    end

    it 'is invalid without a city' do
      calendar_event = build(:calendar_event, city: nil)
      calendar_event.stub(:full_address).and_return(' Albany NY ')
      expect(calendar_event).to be_invalid
    end

    it 'is invalid without a state_id' do
      calendar_event = build(:article, state_id: nil)
      calendar_event.stub(:full_address).and_return(' Albany NY ')
      expect(calendar_event).to be_invalid
    end

    it 'is invalid without a start time' do
      calendar_event = build(:calendar_event, start_time: nil)
      expect(calendar_event).to be_invalid
    end

    it 'is invalid without an end time' do
      calendar_event = build(:calendar_event, end_time: nil)
      expect(calendar_event).to be_invalid
    end
  end
end
