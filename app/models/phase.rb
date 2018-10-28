class Phase < ApplicationRecord
  belongs_to :plan

  has_many :weeks
  has_many :days, through: :weeks
end
