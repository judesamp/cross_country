FactoryGirl.define do
  
  factory :image do |f|
    f.title "Your Momma"
    f.image_data File.open(File.join(Rails.root, "/spec/fixtures/files/test_image.jpg"))




  end


  factory :invalid_image, class: Image do |f|
    f.title nil
  end

end