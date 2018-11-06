class Plan < ApplicationRecord
  belongs_to :user
  belongs_to :assessment
  has_many :phases
  has_many :weeks
  has_many :days, through: :weeks
end
