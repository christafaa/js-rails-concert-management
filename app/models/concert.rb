class Concert < ActiveRecord::Base
  has_many :tickets
  has_many :attendees, through: :tickets
  has_many :pieces

  validates :title, :venue, :date, presence: true
  validates :title, uniqueness: true
end
