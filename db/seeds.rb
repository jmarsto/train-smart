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
  { type: arc, name: "ARC", description: "The Maximum Steady State:\n\n"\
    " The highest level of intensity at which a muscle can continue to function aerobically,"\
    " and thus, indefinitely, is called the Maximum Steady State (MSS; aka aerobic threshold,"\
    " anaerobic threshold, or lactic threshold). Climbing at an intensity level above the MSS"\
    " relies sufficiently on anaerobic respiration (glycolytic and/or phosphagen) that such"\
    " effort becomes unsustainable, ultimately resulting in fatigue and eventual muscle failure."\
    " In endurance sports, it is often said that the MSS is the singlemost important determinant"\
    " of performance, and so the majority of training activities are geared toward improving it.\n\n"\
    " Aerobic Restoration and Capillarity Training: \n\n"\
    " For rock climbing, the most practical method for raising the MSS is “aerobic respiration and"\
    " capillarity” (ARC) training. This consists of climbing for long, sustained periods as close as"\
    " possible to the MSS. This is best performed by climbing on vertical to slightly overhanging"\
    " terrain that places a steady load on the forearms so that a moderate, but sustainable pump ensues"\
    " for upwards of 30 minutes. In climbing, ARC training is used to:\n\n"\
    "• Develop a foundation of muscular fitness to prepare for more-intense training\n
    • Improve local forearm capillarity for improved aerobic energy metabolism\n
    • Improve grip control (to prevent “over-gripping”) and pump-management skills\n
    • Aid recovery from intense training and performance efforts\n
    • Acquire and practice new movement skills and techniques\n\n"\
    " Because of the moderate intensity, ARC training gradually develops muscular fitness in all of the prime"\
    " movers needed for climbing. This provides a gradual introduction to the more-intense activities that"\
    " will be introduced later in the training cycle, stimulating modest adaptations to prepare the body for"\
    " the upcoming additional stress. More importantly, this training establishes the base level of fitness"\
    " that each climbing performance relies on, and off which other performance characteristics (strength,"\
    " power, and power-endurance) build. Therefore, Base-Fitness training is an integral part of any training program.\n "\
    "(https://rockclimberstrainingmanual.com/training-for-rock-climbing/base-fitness/)\n
    Suggested Progression: \n\n"\
    "To progress, we want to steadily increase the volume of climbing while staying below our aerobic threshold."\
    " Try starting with 2x or 3x 15-minute windows of moderate intensity, managing a steady load on the forearms."\
    " Progress to longer windows of climbing, recalibrating intensity appropriately so as to not exceed aerobic threshold."\
    " Shoot for 3x30min." },
  { type: pt, name: "PT", description: "Exercise Description..." },
  { type: pt, name: "Rice Bucket Exercises", description: "Exercise Description..." },
  { type: hb, name: "Hangboard", description: "Exercise Description..." },
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
  { type: boulder, name: "LB", description: "Exercise Description... Limit Bouldering" },
  { type: boulder, name: "4x4s", description: "Exercise Description..." },
  { type: boulder, name: "LBC", description: "Exercise Description... Linked Boulder Circuits" },
  { type: boulder, name: "Lock-Off Laps", description: "Exercise Description..." },
  { type: boulder, name: "WBL", description: "Exercise Description... Warmup Boulder Ladder" },
  { type: campus, name: "Campus", description: "Exercise Description..." }
])
