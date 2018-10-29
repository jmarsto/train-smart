class Api::V1::ProgramsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    user_plans = []
    current_user.personalized_plans.each do |personal_plan|
      user_plans << personal_plan.plan
    end
    user_assessments_and_plans = {
      user: current_user,
      assessments: current_user.assessments,
      plans: user_plans
    }
    render json: user_assessments_and_plans
  end

  def create
    binding.pry
  end

end
