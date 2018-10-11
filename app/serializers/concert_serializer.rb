class ConcertSerializer < ActiveModel::Serializer
  attributes :id, :title, :venue, :date
  has_many :attendees
end
