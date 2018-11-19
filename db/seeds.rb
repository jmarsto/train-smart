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
  { type: se, name: "Inverted Rows", description: "Inverted Row Progression:\n\n"\
  "Video demo: https://youtu.be/A5QYcxf8FD8 \n"\
  "To make this easier or harder, change the angle of your body. Closer to standing"\
  " will be easier, while closer to horizontal will be harder." },
  { type: se, name: "Aerobic Exercise", description: "Exercise Description..." },
  { type: se, name: "Bicep Curls", description: "Exercise Description..." },
  { type: se, name: "Push-Ups", description: "Push Ups:\n\n"\
  "Find a quantity you can do just barely do 3 sets of, focusing on form and control." },
  { type: se, name: "Shoulder Press", description: "Exercise Description..." },
  { type: se, name: "Dips", description: "Exercise Description..." },
  { type: se, name: "Lat Pull-Downs", description: "Exercise Description..." },
  { type: se, name: "Pull Ups", description: "Pull Ups:\n\n"\
  "An age old classic. Putting in some reps with the big pull muscles will keep the rest"\
  " of your body engaged throughout your hangboard phase. Focus on form, keeping the scapula tucked"\
  " back. Feel free to experiment with making the average pull up harder or easier, shooting to be able"\
  " to accomplish around 3 sets of 10."  },
  { type: arc, name: "ARC", description: "Aerobic Restoration and Capillarity Training:\n\n"\
    " The highest level of intensity at which a muscle can continue to function aerobically,"\
    " and thus, indefinitely, is called the Maximum Steady State (MSS; aka aerobic threshold,"\
    " anaerobic threshold, or lactic threshold). Climbing at an intensity level above the MSS"\
    " relies sufficiently on anaerobic respiration (glycolytic and/or phosphagen) that such"\
    " effort becomes unsustainable, ultimately resulting in fatigue and eventual muscle failure."\
    " In endurance sports, it is often said that the MSS is the singlemost important determinant"\
    " of performance, and so the majority of training activities are geared toward improving it.\n\n"\
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
  { type: pt, name: "PT", description: "Physical Therapy\n\n"\
  "If you struggle with previous injuries, however acutely, it is important to strengthen"\
  " not only the affected muscles or tendons, but those surrounding them as well. As your climbing progresses"\
  " even a minor injury left unconsidered will become a limiting factor in performance."\
  " If you do not have a pre-established PT routine that has helped you in the past, take the time"\
  " to research and create one with the help of professional guidance.  Two half hour sessions a week"\
  " can make the difference of complete immobility and unhindered performance on the rock.\n\n"\
  "Consider how warm the affected areas of your body are before attempting high-intensity exercises."\
  " If it is chronic inflammation you deal with, consider nutrition and hydration as equally vital parts"\
  " of your self-care as stretching and warm-up exercises. Rice bucket exercises and inverse wrist curls"\
  " can be helpful exercises to treat tendonitis in the elbow."},
  { type: pt, name: "Rice Bucket", description: "Rice Bucket Exercises:\n\n"\
  "https://www.youtube.com/watch?v=Qd_oKnHG1sc" },
  { type: hb, name: "Hangboard", description: "Hangboard Training Progression\n\n"\
  "There are many resources available for education on the science of hangboard training."\
  " Amongst them are the materials put out by the Anderson brothers, condensed here:"\
  " https://www.trainingbeta.com/mark-and-mike-anderson-guide-to-hangboard-training/"\
  " and more extensively, here: https://rockclimberstrainingmanual.com/training-for-rock-climbing/strength/\n\n"\
  "Important to this phase of training is RESTING between hangboard workouts. To be effective, your body needs"\
  " a period of recovery and subsequent supercompensation.  If we do not allow sufficient rest between"\
  " workouts, we will not give opportunity to the physiological adaptation targetted through training."},
  { type: skills, name: "ARC+", description: "Dynamic Aerobic Restoration and Capillarity Training:\n\n"\
  "Practice as if for regular ARC Training, but practice big moves that require two moving limbs. Our goal here"\
  " is to become more comfortable in dynamic movement, moments of transition, and latching holds from big moves."\
  " Push yourself to huck for holds that you might not be able to stick, or maybe you don't know how positive they are."\
  " The more uncertainty and dynamic movement you can incorporate into your practice, the more prepared you will be on"\
  " your future onsight attempts. If frequent dynamic movement is too tiresome to stay within your aerobic threshold,"\
  " try to 'climb with momentum', keeping your body moving upwards at a consistent speed. Accelerate until you feel a bit"\
  " of haste. Force yourself to keep moving, regardless of if you have found your next ideal hold. This does not need to be"\
  " the entire time of your ARC exercise, but incorporating speed and movement into your regular practice will help when it"\
  " comes to dynamic movement in the future."},
  { type: skills, name: "ARC-", description: "Static Aerobic Restoration and Capillarity Training:\n\n"\
  "Practice as if for regular ARC Training, but practice efficiency of movement, precise footwork, and try to slow down."\
  " If you are a hastier, more dynamic climber, use this as an opportunity to work your static movement. Hover your hand over"\
  " your next hold for a couple seconds before using it. Keep your breath slow and deep. Maintain control. Climb as if you are"\
  " soloing or being penalized for making noise on the wall." },
  { type: skills, name: "Fall", description: "Lead Fall Progression\n\n"\
  "Training our mind is just as important as training our body. And, if our mental fortitude is ever a limiting factor"\
  " in our performance, it might be argued that the training of the mind is even more important than physical training. "\
  "To progress mentally as a climber, we must challenge our fears. Namely, that of falling. If we do not attempt moves because "\
  "of fear, we will stay away from truly performing at our limits. The margin between moves we can do securely and confidently"\
  " and moves that are desperate and insecure, but still possible, is a wide one. Arno Ilgner has several written resources "\
  "for mental training that are extremely worthwhile. Anyone can benefit from reading his lessons.\n"\
  "To become more comfortable with falling, and to be safer when we do fall, it is something we must practice. ARCing on lead "\
  "can give ample opportunity for practicing falling. Start by falling AT your last clipped quickdraw. Fall at least once each"\
  " session. Increase the distance of your fall gradually and safely session to session. Keep your body relaxed and your eyes"\
  " open and alert. Only bite of what you can chew - we do not want to make ourselves MORE afraid. We want gentle exposure"\
  " therapy in a controlled, safe environment. And then, when the day comes to execute the last move of our project, well above"\
  " our last draw - we will have the confidence to go for it!" },
  { type: skills, name: "Flexibility", description: "Flexibility Training\n\n"\
  "You have indicated that flexibility is sometimes a limiting factor to your athletic performance."\
  " Find a window of time to warm up your body with light aerobic exercise, and stretch. Maybe you do this while"\
  " watching TV.  Maybe you sign up for a weekly yoga class. Maybe you stretch thoroughly during each climbing session."\
  " Regardless of how it takes shape, it is important to commit to a regular practice to improve your mobility. Identify"\
  " what parts of your body are not as flexible as you hope, warm them up, and show them some love. " },
  { type: core, name: "Leg Lifts", description: "Exercise Description..." },
  { type: core, name: "Hanging Leg Raises", description: "Exercise Description..." },
  { type: core, name: "Core", description: "Functional Core Training with Gymnastic Rings:\n\n"\
  "https://rockclimberstrainingmanual.com/2015/05/27/functional-core-training/" },
  { type: core, name: "Planks", description: "Exercise Description..." },
  { type: core, name: "Soul-Squeezes", description: "Exercise Description..." },
  { type: boulder, name: "LB", description: "Limit Bouldering\n\n"\
  "Limit bouldering is arguably the ideal method for improving power and contact strength while focusing attention"\
  " on sport-specific factors like technique and body strength. Limit bouldering is climbing short boulder problems"\
  " that feature one to two crux moves that are right at the climber’s limit. Limit bouldering entails focusing on"\
  " short boulder problems that emphasize one or two extremely hard moves (rather than problems that entail six to"\
  " eight pretty hard moves, or 10 to 20 kinda hard moves). To improve recruitment and power, the number of"\
  " repetitions must be small, and the intensity very high. Bouldering at a lower intensity is enjoyable and can be"\
  " applied to other training goals, but for power training, the moves must be extremely difficult and few in number.\n"\
  "Outdoor bouldering is a fine substitute for gym training when possible for limit bouldering.\n"\
  "Make sure your body is warm and ready to try hard before limit bouldering.\n"\
  "(https://rockclimberstrainingmanual.com/training-for-rock-climbing/power/)" },
  { type: boulder, name: "4x4s", description: "Exercise Description..." },
  { type: boulder, name: "LBC", description: "Linked Boulder Circuits\n\n"\
  "Select a series of boulder problems that can be climbed in sequence without stopping. The boulder problems should"\
  " include a total of 25-50 hand moves or 1-3 minutes of climbing depending on the type of route you are training for."\
  " Completing all of the boulder problems in sequence is 1 set. To start, you’ll do 3-5 sets for each workout with 5 minutes"\
  " rest between sets. As you progress through your training cycle, you’ll want to decrease the amount of rest time to around"\
  " 2 minutes between sets. (http://blog.trango.com/training-takeover-power-endurance-and-linked-bouldering-circuits/)\n\n"\
  "Pumpy redpoint attempts make a good weekend replacement to satisfy the same training needs, while translating training to"\
  " more outdoor conditioning." },
  { type: boulder, name: "Lock-Off Laps", description: "Exercise Description..." },
  { type: boulder, name: "WBL", description: "Warmup Boulder Ladder\n\n"\
  "Complete 1-3 problems of every grade that you can reliably climb, low to high. Taper down to one of each difficulty"\
  " as you approach your limit. If you fall, try again - but this is not the time for projecting. Take time between each"\
  " problem - this is a warm up, not a session. If you need more of a warmup, do some light traversing before this."},
  { type: campus, name: "Campus", description: "Campus Board Training:\n\n"\
  "Do your research on this aggressive exercise. Not for everyone."\
  "(https://rockclimberstrainingmanual.com/2012/10/03/campus-training-part-1-history-theory-campus-board-construction/)" }
])
