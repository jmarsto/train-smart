class DaySerializer < ActiveModel::Serializer
  attributes :id, :name, :exercises

  has_many :exercises
end
