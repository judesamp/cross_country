FactoryGirl.define do
  
  factory :session do |f|
    f.email "email@email.com"
    f.password "bill"
  end


  factory :invalid_session, class: User do |f|
    f.email nil
  end

end