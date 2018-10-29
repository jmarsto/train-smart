class PersonalizedPlan < ApplicationRecord
  belongs_to :plan
  belongs_to :assessment
  belongs_to :user
end
