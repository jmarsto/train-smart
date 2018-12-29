class DaySerializer < ActiveModel::Serializer
  attributes :id, :name, :workouts

  has_many :workouts
end
