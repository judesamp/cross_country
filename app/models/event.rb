class Event < ActiveRecord::Base
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :comments

  mount_uploader :event_image, EventImageUploader
end