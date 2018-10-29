class Api::V1::AssessmentsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def create
    new_assessment = Assessment.new(assessment_params)
    new_assessment.user = current_user

    if new_assessment.save
      new_personalized_plan = PersonalizedPlan.new
      new_personalized_plan.user = current_user
      new_personalized_plan.assessment = new_assessment
      new_personalized_plan.plan = Plan.first

      if new_personalized_plan.save
        render json: new_personalized_plan
      else
        render json: { errors: new_personalized_plan.errors.full_messages }, status: :unprocessable_entity
      end

    else
      render json: { errors: new_assessment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
    def assessment_params
      params.require(:assessment).permit(:pt, :crusher, :days, :enduro)
    end
end
