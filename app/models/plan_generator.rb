class PlanGenerator
  def initialize(assessment, user)
    @assessment = assessment
    @user = user
  end

  def generate
    new_plan = Plan.new
    new_plan.user = @user
    new_plan.assessment = @assessment
    new_plan.save

    @arc = Exercise.find_by(name: "ARC")
    @wbl = Exercise.find_by(name: "WBL")

    create_phases_for new_plan
    calculate_weeks_in_phases_of new_plan
    construct_base_fitness_phase
    construct_strength_phase
    construct_power_phase
    construct_power_endurance_phase
    consider_pt_for new_plan

    return new_plan
  end

  private
    def create_phases_for plan
      @phase_BF = Phase.create(plan: plan, name: "BF")
      @phase_HB = Phase.create(plan: plan, name: "HB")
      @phase_POW = Phase.create(plan: plan, name: "POW")
      @phase_PE = Phase.create(plan: plan, name: "PE")
    end

    def calculate_weeks_in_phases_of plan
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
        Week.create(phase: @phase_BF, number: week_count, plan: plan)
        week_count += 1
      end

      weeks_HB.times do
        Week.create(phase: @phase_HB, number: week_count, plan: plan)
        week_count += 1
      end

      weeks_POW.times do
        Week.create(phase: @phase_POW, number: week_count, plan: plan)
        week_count += 1
      end

      weeks_PE.times do
        Week.create(phase: @phase_PE, number: week_count, plan: plan)
        week_count += 1
      end
    end

    def construct_base_fitness_phase
      if @assessment.days
        @phase_BF.days.each_slice(2) do |two_days|
          Workout.create(exercise: @arc, day: two_days.first)
        end
      else
        @phase_BF.days.each_slice(3) do |three_days|
          Workout.create(exercise: @arc, day: three_days.first)
        end
      end
    end

    def construct_strength_phase
      hb = Exercise.find_by(name: "Hangboard")
      rows = Exercise.find_by(name: "Inverted Rows")
      pullups = Exercise.find_by(name: "Pull Ups")

      @phase_HB.days.each_slice(3) do |three_days|
        Workout.create(exercise: hb, day: three_days.first)
        Workout.create(exercise: rows, day: three_days.first)
        Workout.create(exercise: pullups, day: three_days.first)
      end
    end

    def construct_power_phase
      lb = Exercise.find_by(name: "LB")
      campus = Exercise.find_by(name: "Campus")

      if @assessment.crusher
        @phase_POW.weeks.each do |week|
          Workout.create(exercise: lb, day: week.days.find_by(name: "Sunday"))
          Workout.create(exercise: lb, day: week.days.find_by(name: "Tuesday"))
          Workout.create(exercise: @wbl, day: week.days.find_by(name: "Thursday"))
          Workout.create(exercise: campus, day: week.days.find_by(name: "Thursday"))
          Workout.create(exercise: lb, day: week.days.find_by(name: "Saturday"))
        end
      else
        @phase_POW.weeks.each do |week|
          Workout.create(exercise: lb, day: week.days.find_by(name: "Sunday"))
          Workout.create(exercise: lb, day: week.days.find_by(name: "Tuesday"))
          Workout.create(exercise: @arc, day: week.days.find_by(name: "Thurday"))
          Workout.create(exercise: lb, day: week.days.find_by(name: "Friday"))
        end
      end
    end

    def construct_power_endurance_phase
      lbc = Exercise.find_by(name: "LBC")

      @phase_PE.weeks.each do |week|
        Workout.create(exercise: lbc, day: week.days.find_by(name: "Wednesday"))
        Workout.create(exercise: @wbl, day: week.days.find_by(name: "Wednesday"))
      end
    end

    def consider_pt_for plan
      pt = Exercise.find_by(name: "PT")

      if @assessment.pt
        plan.days.each_slice(4) do |four_days|
          Workout.create(exercise: pt, day: four_days.first)
        end
      end
    end

end
