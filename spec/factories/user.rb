FactoryGirl.define do
  
  factory :user do |f|
    f.email Faker::Internet.email
    f.password Faker::Internet.password
    #f.password_confirmation "dude"
  end


  factory :invalid_user, class: User do |f|
    f.email nil
  end

  factory :custom_user, class: User do |f|
    f.email "email@email.com"
    f.password "bill"
    f.password_confirmation "bill"
  end

end
