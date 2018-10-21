class Week < ApplicationRecord
  validates :number, numericality: true

  belongs_to :period
  belongs_to :plan

end
