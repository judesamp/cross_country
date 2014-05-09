FactoryGirl.define do
  
  factory :image do |f|
    f.title "Your Momma"
    f.image_data "image_data"
  end


  factory :invalid_image, class: Image do |f|
    f.title nil
  end

end