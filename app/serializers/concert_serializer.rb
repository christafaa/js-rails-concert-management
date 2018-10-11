class ConcertSerializer < ActiveModel::Serializer
  attributes :id, :title, :venue, :date
end
