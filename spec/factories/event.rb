FactoryGirl.define do
  
  factory :event do |f|
    f.name "This is my comment!"
    f.event_date 2.days.ago
  end


  factory :invalid_event, class: Event do |f|
    f.name nil
  end

  factory :event_with_image, class: Event do |f|
    f.name "This is my comment!"
    f.event_date 2.days.ago
    f.event_image File.open(File.join(Rails.root, "/spec/fixtures/files/test_image.jpg"))
  end

end


