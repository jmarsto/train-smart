class Plan < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :assessment, optional: true

  has_many :phases
  has_many :weeks
  has_many :days, through: :weeks
end
