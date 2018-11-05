class Week < ApplicationRecord
  after_create :add_days
  validates :number, numericality: true

  belongs_to :phase
  belongs_to :plan, touch: true

  has_many :days
  has_many :workouts, through: :days

  private
    def add_days
      Day.create([
        { week: self, name: "Sunday" },
        { week: self, name: "Monday" },
        { week: self, name: "Tuesday" },
        { week: self, name: "Wednesday" },
        { week: self, name: "Thursday" },
        { week: self, name: "Friday" },
        { week: self, name: "Saturday" }
        ])
    end
end
