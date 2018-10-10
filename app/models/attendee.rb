class Attendee < ActiveRecord::Base
  belongs_to :user, optional: true
  has_many :tickets
  has_many :concerts, through: :tickets

  validates :first_name, :last_name, presence: true

  validates :age, numericality: { greater_than: 0, allow_nil: true }

  validates :wealth_rating, numericality: { greater_than: 0, allow_nil: true }
  validates :wealth_rating, numericality: { less_than: 10, allow_nil: true }

  scope :alpha, -> { order('last_name ASC') }

  scope :best_wealth_rating, -> { order('-wealth_rating DESC') }

  scope :most_tickets, -> { joins(:tickets).group('tickets.attendee_id').order('COUNT(tickets.attendee_id) DESC') }

  def self.top_prospects(collection)
    collection.sort_by {|attendee| attendee.points}.reverse
  end

  def self.collection_of(association)
    where(id: association.attendees.map(&:id))
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def points
    total = 0

    if self.wealth_rating
      case self.wealth_rating
      when 1 then total += 50
      when 2 then total += 45
      when 3 then total += 40
      when 4 then total += 35
      when 5 then total += 30
      when 6 then total += 25
      when 7 then total += 20
      when 8 then total += 15
      end
    end
    total += self.tickets.count
  end
end
