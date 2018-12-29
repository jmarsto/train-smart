class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :exercise

  belongs_to :exercise
end
