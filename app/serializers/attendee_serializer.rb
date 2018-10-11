class AttendeeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :profession, :age, :wealth_rating
end
