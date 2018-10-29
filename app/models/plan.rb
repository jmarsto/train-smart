class Plan < ApplicationRecord
  has_many :personalized_plans
  has_many :phases
  has_many :weeks
  has_many :days, through: :weeks
end
