class Exercise < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  
  belongs_to :session, optional: true, touch: true
  belongs_to :type
end
