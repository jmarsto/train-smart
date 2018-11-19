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
    @core = Exercise.find_by(name: "Core")
    @rice = Exercise.find_by(name: "Rice Bucket")

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
      pushups = Exercise.find_by(name: "Push-Ups")
      arc_d = Exercise.find_by(name: "ARC+")
      arc_s = Exercise.find_by(name: "ARC-")
      fall = Exercise.find_by(name: "Fall")

      if @assessment.static
        if @assessment.days
          @phase_BF.days.each_slice(4) do |four_days|
            Workout.create(exercise: @arc, day: four_days.first)
            Workout.create(exercise: pushups, day: four_days.first)
            Workout.create(exercise: arc_d, day: four_days.third)
            Workout.create(exercise: pushups, day: four_days.third)
          end
        else
          @phase_BF.days.each_slice(6) do |six_days|
            Workout.create(exercise: @arc, day: six_days.first)
            Workout.create(exercise: pushups, day: six_days.first)
            Workout.create(exercise: arc_d, day: six_days.fourth)
            Workout.create(exercise: pushups, day: six_days.fourth)
          end
        end
      else
        if @assessment.days
          @phase_BF.days.each_slice(4) do |four_days|
            Workout.create(exercise: @arc, day: four_days.first)
            Workout.create(exercise: pushups, day: four_days.first)
            Workout.create(exercise: arc_s, day: four_days.third)
            Workout.create(exercise: pushups, day: four_days.third)
          end
        else
          @phase_BF.days.each_slice(6) do |six_days|
            Workout.create(exercise: @arc, day: six_days.first)
            Workout.create(exercise: pushups, day: six_days.first)
            Workout.create(exercise: arc_s, day: six_days.fourth)
            Workout.create(exercise: pushups, day: six_days.fourth)
          end
        end
      end

      @phase_BF.weeks.each do |week|
        Workout.create(exercise: @core, day: week.days.fourth)
      end

      if !@assessment.mental
        @phase_BF.days.each do |day|
          if day.exercises.count >= 2
            Workout.create(exercise: fall, day: day)
          end
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

      @phase_HB.weeks.each do |week|
        Workout.create(exercise: @core, day: week.days.fourth)
      end
    end

    def construct_power_phase
      lb = Exercise.find_by(name: "LB")
      campus = Exercise.find_by(name: "Campus")

      if @assessment.tendonitis
        @phase_POW.weeks.each do |week|
          Workout.create(exercise: @rice, day: week.days.find_by(name: "Tuesday"))
          Workout.create(exercise: @rice, day: week.days.find_by(name: "Thursday"))
        end
      end

      if @assessment.crusher && @assessment.days
        @phase_POW.weeks.each do |week|
          Workout.create(exercise: lb, day: week.days.find_by(name: "Sunday"))
          Workout.create(exercise: lb, day: week.days.find_by(name: "Tuesday"))
          Workout.create(exercise: @wbl, day: week.days.find_by(name: "Thursday"))
          Workout.create(exercise: campus, day: week.days.find_by(name: "Thursday"))
          Workout.create(exercise: lb, day: week.days.find_by(name: "Saturday"))
        end
      elsif @assessment.crusher && !@assessment.days
        @phase_POW.weeks.each do |week|
          Workout.create(exercise: lb, day: week.days.find_by(name: "Sunday"))
          Workout.create(exercise: lb, day: week.days.find_by(name: "Tuesday"))
          Workout.create(exercise: @wbl, day: week.days.find_by(name: "Thursday"))
          Workout.create(exercise: campus, day: week.days.find_by(name: "Thursday"))
        end
      else
        @phase_POW.weeks.each do |week|
          Workout.create(exercise: lb, day: week.days.find_by(name: "Sunday"))
          Workout.create(exercise: lb, day: week.days.find_by(name: "Tuesday"))
          Workout.create(exercise: @arc, day: week.days.find_by(name: "Thursday"))
        end
        if @assessment.days
          @phase_POW.weeks.each do |week|
              Workout.create(exercise: lb, day: week.days.find_by(name: "Friday"))
          end
        end
      end
    end

    def construct_power_endurance_phase
      lbc = Exercise.find_by(name: "LBC")

      @phase_PE.weeks.each do |week|
        Workout.create(exercise: @wbl, day: week.days.find_by(name: "Wednesday"))
        Workout.create(exercise: lbc, day: week.days.find_by(name: "Wednesday"))
        Workout.create(exercise: @wbl, day: week.days.find_by(name: "Saturday"))
        Workout.create(exercise: lbc, day: week.days.find_by(name: "Saturday"))
        Workout.create(exercise: @wbl, day: week.days.find_by(name: "Sunday"))
        Workout.create(exercise: lbc, day: week.days.find_by(name: "Sunday"))
      end
    end

    def consider_pt_for plan
      pt = Exercise.find_by(name: "PT")
      flex = Exercise.find_by(name: "Flexibility")

      if @assessment.pt
        plan.days.each_slice(4) do |four_days|
          Workout.create(exercise: pt, day: four_days.first)
        end
        plan.phases.first.days.each do |day|
          if day.workouts.count > 1
            Workout.create(exercise: @rice, day: day)
          end
        end
      elsif !@assessment.pt && @assessment.tendonitis
        plan.phases.first.days.each do |day|
          if day.workouts.count > 1
            Workout.create(exercise: @rice, day: day)
          end
        end
      end

      if !@assessment.flexible
        plan.weeks.each do |week|
          Workout.create(exercise: flex, day: week.days.find_by(name: "Sunday"))
        end
      end
    end

end
