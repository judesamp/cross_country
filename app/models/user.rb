class User < ActiveRecord::Base
  has_many :images
  has_many :events

  validates_presence_of :email
  has_secure_password

end