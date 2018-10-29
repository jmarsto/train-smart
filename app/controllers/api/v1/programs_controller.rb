class Api::V1::ProgramsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    render json: serialized_data(current_plan)
  end

  def create
    binding.pry
  end

  private

  def current_plan
    current_user.personalized_plans.last.plan
  end

  def serialized_data(plan)
    { phases: serialized_phases(plan.phases) }
  end

  def serialized_phases(phases)
    phases_array = []
    phases.each do |phase|
      phase_hash = {
        weeks: serialized_weeks(phase.weeks)
      }
      phases_array << phase_hash
    end
    phases_array
  end

  def serialized_weeks(weeks)
    weeks_array = []
    weeks.each do |week|
      week_hash = {
        days: ActiveModel::Serializer::ArraySerializer.new(week.days, each_serializer: DaySerializer)
      }
      weeks_array << week_hash
    end
    weeks_array
  end
end
