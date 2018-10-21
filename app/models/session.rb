class Session < ApplicationRecord
  belongs_to :day, touch: true

end
