class Api::V1::ProgramsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    user_assessments_and_plans = {
      user: current_user,
      assessments: current_user.assessments,
      plans: current_user.plans
    }
    render json: user_assessments_and_plans
  end

  def create
    binding.pry
  end

end
