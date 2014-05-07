class Event < ActiveRecord::Base
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :comments
  validates_presence_of :name
  validates_presence_of :event_date

  def self.desc
    Event.all.reverse_order
  end

  mount_uploader :event_image, EventImageUploader
end