class Assessment < ApplicationRecord
  validates_inclusion_of :pt, in: [true, false]
  validates_inclusion_of :crusher, in: [true, false]
  validates_inclusion_of :days, in: [true, false]
  validates_inclusion_of :enduro, in: [true, false]
  validates_inclusion_of :trainable, in: [true, false]
  validates_inclusion_of :static, in: [true, false]
  validates_inclusion_of :mental, in: [true, false]
  validates_inclusion_of :flexible, in: [true, false]
  validates_inclusion_of :tendonitis, in: [true, false]

  belongs_to :user
  has_many :plans
end
