class Piece < ActiveRecord::Base
  belongs_to :concert

  validates :title, :composer, presence: true
  validates :date_composed, numericality: { greater_than: 0 }
end
