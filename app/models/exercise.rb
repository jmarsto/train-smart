class Exercise < ApplicationRecord
  validates :name, presence: true, allow_blank: false

  belongs_to :workout, optional: true, touch: true
  belongs_to :type
end
