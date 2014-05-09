FactoryGirl.define do
  
  factory :event do |f|
    f.name "This is my comment!"
    f.event_date 2.days.ago
  end


  factory :invalid_event, class: Event do |f|
    f.name nil
  end

end