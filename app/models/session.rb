class Session < ApplicationRecord
  belongs_to :day, touch: true

  has_many :exercises
  has_many :types, through: :exercises
end
