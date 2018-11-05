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
