class Period < ApplicationRecord
  belongs_to :plan

  has_many :weeks
end
