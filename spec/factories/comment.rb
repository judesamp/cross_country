FactoryGirl.define do
  
  factory :comment do |f|
    f.content "This is my comment!"
    f.commentable_id 2
  end


  factory :invalid_comment, class: Comment do |f|
    f.content ""
  end

end