class Plan < ApplicationRecord
  belongs_to :user
  belongs_to :assessment

  has_many :periods
end
