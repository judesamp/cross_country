class Image < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :comments, as: :commentable
  belongs_to :user
  accepts_nested_attributes_for :tags, :reject_if => :all_blank
  validates_presence_of :title
  mount_uploader :image_data, ImageDataUploader
  
  default_scope { order('image_date DESC') } 

  

  def self.descending
    Image.order('image_date DESC').all
  end
end