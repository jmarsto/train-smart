class Assessment < ApplicationRecord
  validates :pt, presence: true
  validates :crusher, presence: true
  validates :days, presence: true
  validates :enduro, presence: true

  belongs_to :user
end
