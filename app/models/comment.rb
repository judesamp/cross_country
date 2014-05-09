class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  validates :content, length: { minimum: 2 }, allow_blank: false, allow_nil: false
  validates_presence_of :commentable_id

  scope :desc, order("created_at DESC") 

end