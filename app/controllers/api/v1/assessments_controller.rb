class Api::V1::AssessmentsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    render json: current_user.assessments.last
  end

  def update
    assessment = Assessment.find(params[:id])
    if assessment.update_attributes(assessment_params)
      PlanGenerator.new(assessment, current_user).generate
      head :created
    else
      head :bad_request
    end
  end

  def create
    new_assessment = Assessment.new(assessment_params)
    new_assessment.user = current_user

    if new_assessment.save
      new_personalized_plan = PlanGenerator.new(new_assessment, current_user).generate

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
