class Assessment < ApplicationRecord
  validates_inclusion_of :pt, in: [true, false]
  validates_inclusion_of :crusher, in: [true, false]
  validates_inclusion_of :days, in: [true, false]
  validates_inclusion_of :enduro, in: [true, false]

  belongs_to :user
end
