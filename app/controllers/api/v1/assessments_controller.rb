class Api::V1::AssessmentsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def create

    new_assessment = Assessment.new(assessment_params)
    new_assessment.user = current_user

    if new_assessment.save

# - - - # - - - HERE IS THE MEAT OF PLAN GENERATOR - - - # - - - # - - - # - - - # - - - # - - - #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
  # PlanGenerator.new(current_user, new_assessment).generate_new_plan
  # ^ all in the controller
  #
  # class PlanOrganizer
  #
  #   def initialize(user, assessment_info)
  #     @user
  #     @pt = assessment_params["pt"]
  #     ....
  #
  #
  #   end
  #
  #   def generate_new_plan
  #
  #   end
  #
  #   def personalized_plan
  #
  #   end
  #
  # end

new_plan = Plan.create
phase_BF = Phase.create(plan: new_plan, name: "BF")
phase_HB = Phase.create(plan: new_plan, name: "HB")
phase_POW = Phase.create(plan: new_plan, name: "POW")
phase_PE = Phase.create(plan: new_plan, name: "PE")

weeks_BF = 4
weeks_HB = 3
weeks_POW = 2
weeks_PE = 3

if new_assessment.enduro && new_assessment.crusher
  weeks_BF = 3
  weeks_HB = 4
elsif !new_assessment.enduro && !new_assessment.crusher
  weeks_BF = 3
  weeks_HB = 3
  weeks_POW = 3
elsif !new_assessment.enduro && new_assessment.crusher
  weeks_BF = 2
  weeks_HB = 4
  weeks_POW = 3
end

week_count = 1

weeks_BF.times do
  Week.create(phase: phase_BF, number: week_count, plan: new_plan)
  week_count += 1
end

weeks_HB.times do
  Week.create(phase: phase_HB, number: week_count, plan: new_plan)
  week_count += 1
end

weeks_POW.times do
  Week.create(phase: phase_POW, number: week_count, plan: new_plan)
  week_count += 1
end

weeks_PE.times do
  Week.create(phase: phase_PE, number: week_count, plan: new_plan)
  week_count += 1
end

new_plan.weeks.each do |week|
  Day.create([
    { week: week, name: "Sunday" },
    { week: week, name: "Monday" },
    { week: week, name: "Tuesday" },
    { week: week, name: "Wednesday" },
    { week: week, name: "Thursday" },
    { week: week, name: "Friday" },
    { week: week, name: "Saturday" }
    ])
  end
  # we can replace this with an after_create method that automatically does this

pt = Exercise.find_by(name: "Physical Therapy")
arc = Exercise.find_by(name: "ARC Progression")
hb = Exercise.find_by(name: "Hangboad Progression")

if new_assessment.days
  phase_BF.days.each_slice(2) do |two_days|
    Workout.create(exercise: arc, day: two_days.first)
  end
else
  phase_BF.days.each_slice(3) do |three_days|
    Workout.create(exercise: arc, day: three_days.first)
  end
end

if new_assessment.pt
  new_plan.days.each_slice(4) do |four_days|
    Workout.create(exercise: pt, day: four_days.first)
  end
end

phase_HB.days.each_slice(3) do |three_days|
  Workout.create(exercise: hb, day: three_days.first)
end


new_personalized_plan = PersonalizedPlan.new
new_personalized_plan.user = current_user
new_personalized_plan.assessment = new_assessment
new_personalized_plan.plan = new_plan

# - - - # - - - # - - - # - - - END OF PLAN GENERATOR - - - # - - - # - - - # - - - # - - - #
# - - # - - - # - - - # - - - # - - - # - - - # - - - # - - - # - - - # - - - # - - - # - - - #


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
