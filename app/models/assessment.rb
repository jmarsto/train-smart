class Assessment < ApplicationRecord
  belongs_to :user

  validates :pt, presence: true
  validates :crusher, presence: true
  validates :days, presence: true
  validates :enduro, presence: true
end
