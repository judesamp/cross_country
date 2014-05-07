class Tag < ActiveRecord::Base
  has_and_belongs_to_many :images
    validates :name, length: { minimum: 2 }, allow_blank: false, allow_nil: false

end