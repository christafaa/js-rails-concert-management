class User < ActiveRecord::Base
  has_many :attendees

  validates :username, :password, presence: true
  validates :username, uniqueness: true
  has_secure_password
end
