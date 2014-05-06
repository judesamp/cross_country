class Image < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :tags
  


  mount_uploader :image_data, ImageDataUploader
end