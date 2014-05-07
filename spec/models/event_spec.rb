require 'spec_helper'

describe Event do
  let(:valid_event) {Event.new(name: "Funeral", date: 2.weeks.ago)}
  let(:event_with_no_name) {Event.new(event_date: 2.weeks.ago)}
  let(:event_with_no_date) {Event.new(name: "Funeral")}

  it "should have a name" do
    event_with_no_name.should_not be_valid
  end

  it "should have a date" do
    event_with_no_date.should_not be_valid
  end

  it "should return events in reverse chronological order" do
    event_1 = Event.new(:name => "event #1", event_date: 2.weeks.ago)
    event_1.save
    event_1.created_at = 1.week.ago
    event_1.save
    event_2 = Event.new(:name => "event #2", event_date: 2.weeks.ago)
    sorted_events = Event.desc
    expect(sorted_events[0]).to eq event_1
  end
  
end



  # create_table "events", force: true do |t|
  #   t.string   "name"
  #   t.text     "description"
  #   t.datetime "event_date"
  #   t.string   "event_image"
  # end