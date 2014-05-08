class Image < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :tags, :reject_if => :all_blank
  validates_presence_of :title
  belongs_to :user
  
  #default_scope { order('image_date DESC') } 

  mount_uploader :image_data, ImageDataUploader
end