class Image < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :tags
  validates_presence_of :title
  
  default_scope { order('image_date DESC') } 

  mount_uploader :image_data, ImageDataUploader
end