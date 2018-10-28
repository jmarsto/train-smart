class Workout < ApplicationRecord
  belongs_to :day, touch: true
  belongs_to :exercise
end
