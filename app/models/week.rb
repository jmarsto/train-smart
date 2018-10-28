class Week < ApplicationRecord
  validates :number, numericality: true

  belongs_to :phase
  belongs_to :plan, touch: true

  has_many :days
  has_many :workouts, through: :days
end
