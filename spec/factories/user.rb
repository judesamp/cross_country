FactoryGirl.define do
  
  factory :user do |f|
    f.email Faker::Internet.email
    f.password Faker::Internet.password
    #f.password_confirmation "dude"
  end


  factory :invalid_user, class: User do |f|
    f.email nil
  end

end
