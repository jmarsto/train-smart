class Api::V1::AssessmentsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def create
    new_assessment = Assessment.new(assessment_params)
    new_assessment.user = current_user

    if new_assessment.save
      render json: new_assessment
    else
      render json: { errors: new_assessment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
    def assessment_params
      params.require(:assessment).permit(:pt, :crusher, :days, :enduro)
    end
end
