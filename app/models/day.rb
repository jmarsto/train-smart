class Day < ApplicationRecord
  validates :name, inclusion: { in: %w(Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday) }

  belongs_to :week, touch: true

  has_many :sessions
  has_many :exercises, through: :sessions
end
