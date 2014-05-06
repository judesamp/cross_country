class Event < ActiveRecord::Base
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :comments
  # accepts_nested_attributes_for :tags

  mount_uploader :event_image, EventImageUploader
end