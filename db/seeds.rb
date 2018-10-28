Type.create([
  { name: "PT" },
  { name: "SE" },
  { name: "HB" },
  { name: "ARC" },
  { name: "Skills" },
  { name: "Core" },
  { name: "Boulder" },
  { name: "Campus" }
])

se = Type.find_by(name: "SE")
arc = Type.find_by(name: "ARC")
pt = Type.find_by(name: "PT")
hb = Type.find_by(name: "HB")
skills = Type.find_by(name: "Skills")
core = Type.find_by(name: "Core")
boulder = Type.find_by(name: "Boulder")
campus = Type.find_by(name: "Campus")

Exercise.create([
  { type: se, name: "Inverted Row Progression", description: "Exercise Description..." },
  { type: se, name: "Aerobic Exercise", description: "Exercise Description..." },
  { type: se, name: "Bicep Curls", description: "Exercise Description..." },
  { type: se, name: "Push-Ups", description: "Exercise Description..." },
  { type: se, name: "Shoulder Press", description: "Exercise Description..." },
  { type: se, name: "Dips", description: "Exercise Description..." },
  { type: se, name: "Lat Pull-Downs", description: "Exercise Description..." },
  { type: arc, name: "ARC Progression", description: "Exercise Description..." },
  { type: pt, name: "Physical Therapy", description: "Exercise Description..." },
  { type: pt, name: "Warm Up", description: "Exercise Description..." },
  { type: pt, name: "Rice Bucket Exercises", description: "Exercise Description..." },
  { type: hb, name: "Hangboad Progression", description: "Exercise Description..." },
  { type: skills, name: "Silent Feet", description: "Exercise Description..." },
  { type: skills, name: "Hover Hands", description: "Exercise Description..." },
  { type: skills, name: "Two Points Off", description: "Exercise Description..." },
  { type: skills, name: "Downclimbing", description: "Exercise Description..." },
  { type: skills, name: "Economy of Movement", description: "Exercise Description..." },
  { type: skills, name: "Momentum Climbing", description: "Exercise Description..." },
  { type: core, name: "Leg Lifts", description: "Exercise Description..." },
  { type: core, name: "Hanging Leg Raises", description: "Exercise Description..." },
  { type: core, name: "Ring Progression", description: "Exercise Description..." },
  { type: core, name: "Planks", description: "Exercise Description..." },
  { type: core, name: "Soul-Squeezes", description: "Exercise Description..." },
  { type: boulder, name: "Limit Bouldering", description: "Exercise Description..." },
  { type: boulder, name: "4x4s", description: "Exercise Description..." },
  { type: boulder, name: "Linked Boulder Circuits", description: "Exercise Description..." },
  { type: boulder, name: "Lock-Off Laps", description: "Exercise Description..." },
  { type: boulder, name: "Warmup Boulder Ladder", description: "Exercise Description..." },
  { type: campus, name: "Campus Progression", description: "Exercise Description..." }
])

plan_1 = Plan.create(name: "First")
phase_BF = Phase.create(plan: plan_1, name: "BF")
phase_strength = Phase.create(plan: plan_1, name: "strength")
phase_power = Phase.create(plan: plan_1, name: "power")
phase_PE = Phase.create(plan: plan_1, name: "PE")

Week.create(phase: phase_BF, number: 1, plan: plan_1)
Week.create(phase: phase_BF, number: 2, plan: plan_1)
Week.create(phase: phase_BF, number: 3, plan: plan_1)
Week.create(phase: phase_BF, number: 4, plan: plan_1)
Week.create(phase: phase_strength, number: 5, plan: plan_1)
Week.create(phase: phase_strength, number: 6, plan: plan_1)
Week.create(phase: phase_strength, number: 7, plan: plan_1)
Week.create(phase: phase_power, number: 8, plan: plan_1)
Week.create(phase: phase_power, number: 9, plan: plan_1)
Week.create(phase: phase_PE, number: 10, plan: plan_1)
Week.create(phase: phase_PE, number: 11, plan: plan_1)
Week.create(phase: phase_PE, number: 12, plan: plan_1)

plan_1.weeks.each do |week|
  Day.create([
    { week: week, name: "Sunday" },
    { week: week, name: "Monday" },
    { week: week, name: "Tuesday" },
    { week: week, name: "Wednesday" },
    { week: week, name: "Thursday" },
    { week: week, name: "Friday" },
    { week: week, name: "Saturday" }])
end

plan_1.phases.first.days.each_slice(2) do |two_days|
  arc_exercise = Exercise.find_by(name: "ARC Progression")
  new_workout = Workout.new
  new_workout.exercise = arc_exercise
  new_workout.day = two_days.first
  new_workout.save
end

plan_1.phases.second.days.each_slice(3) do |three_days|
  hb_exercise = Exercise.find_by(name: "Hangboad Progression")
  new_workout = Workout.new
  new_workout.exercise = hb_exercise
  new_workout.day = three_days.first
  new_workout.save
end

plan_1.phases.third.days.each_slice(3) do |three_days|
  wbl_exercise = Exercise.find_by(name: "Limit Bouldering")
  new_workout = Workout.new
  new_workout.exercise = wbl_exercise
  new_workout.day = three_days.first
  new_workout.save
end

plan_1.phases.fourth.weeks.each do |week|
  lbc_exercise = Exercise.find_by(name: "Linked Boulder Circuits")
  sunday_workout = Workout.new
  sunday_workout.exercise = lbc_exercise
  sunday_workout.day = week.days.first
  sunday_workout.save
  wednesday_workout = Workout.new
  wednesday_workout.exercise = lbc_exercise
  wednesday_workout.day = week.days.first
  wednesday_workout.save
end
