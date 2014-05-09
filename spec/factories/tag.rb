FactoryGirl.define do
  
  factory :tag do |f|
    f.name "Tag"
  end


  factory :invalid_tag, class: Tag do |f|
    f.name nil
  end

end