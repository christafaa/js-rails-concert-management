class Ticket < ActiveRecord::Base
  belongs_to :concert
  belongs_to :attendee

  validates :seat_number, presence: true
  validates :seat_number, numericality: { greater_than: 0 }
end
