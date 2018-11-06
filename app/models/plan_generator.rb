class PlanGenerator
  def initialize(assessment, user)
    @assessment = assessment
    @user = user
  end

  def generate
    new_plan = Plan.create
    phase_BF = Phase.create(plan: new_plan, name: "BF")
    phase_HB = Phase.create(plan: new_plan, name: "HB")
    phase_POW = Phase.create(plan: new_plan, name: "POW")
    phase_PE = Phase.create(plan: new_plan, name: "PE")

    weeks_BF = 4
    weeks_HB = 3
    weeks_POW = 2
    weeks_PE = 3

    if @assessment.enduro && @assessment.crusher
      weeks_BF = 3
      weeks_HB = 4
    elsif !@assessment.enduro && !@assessment.crusher
      weeks_BF = 3
      weeks_HB = 3
      weeks_POW = 3
    elsif !@assessment.enduro && @assessment.crusher
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

    pt = Exercise.find_by(name: "PT")
    arc = Exercise.find_by(name: "ARC")
    hb = Exercise.find_by(name: "Hangboard")
    wbl = Exercise.find_by(name: "WBL")
    lb = Exercise.find_by(name: "LB")
    lbc = Exercise.find_by(name: "LBC")
    campus = Exercise.find_by(name: "Campus")

    if @assessment.days
      phase_BF.days.each_slice(2) do |two_days|
        Workout.create(exercise: arc, day: two_days.first)
      end
    else
      phase_BF.days.each_slice(3) do |three_days|
        Workout.create(exercise: arc, day: three_days.first)
      end
    end

    phase_HB.days.each_slice(3) do |three_days|
      Workout.create(exercise: hb, day: three_days.first)
    end

    if @assessment.crusher
      phase_POW.weeks.each do |week|
        Workout.create(exercise: lb, day: week.days.find_by(name: "Sunday"))
        Workout.create(exercise: lb, day: week.days.find_by(name: "Tuesday"))
        Workout.create(exercise: wbl, day: week.days.find_by(name: "Thursday"))
        Workout.create(exercise: campus, day: week.days.find_by(name: "Thursday"))
        Workout.create(exercise: lb, day: week.days.find_by(name: "Saturday"))
      end
    else
      phase_POW.weeks.each do |week|
        Workout.create(exercise: lb, day: week.days.find_by(name: "Sunday"))
        Workout.create(exercise: lb, day: week.days.find_by(name: "Tuesday"))
        Workout.create(exercise: arc, day: week.days.find_by(name: "Thurday"))
        Workout.create(exercise: lb, day: week.days.find_by(name: "Friday"))
      end
    end

    phase_PE.weeks.each do |week|
      Workout.create(exercise: wbl, day: week.days.find_by(name: "Wednesday"))
      Workout.create(exercise: lbc, day: week.days.find_by(name: "Wednesday"))
    end

    if @assessment.pt
      new_plan.days.each_slice(4) do |four_days|
        Workout.create(exercise: pt, day: four_days.first)
      end
    end

    new_personalized_plan = PersonalizedPlan.new
    new_personalized_plan.user = @user
    new_personalized_plan.assessment = @assessment
    new_personalized_plan.plan = new_plan
    new_personalized_plan.save
    return new_personalized_plan
  end
end
