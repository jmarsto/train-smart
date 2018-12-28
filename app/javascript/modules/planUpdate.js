export default class planUpdate {
  constructor(phases, result) {
    this.phases = phases;
    this.exerciseId = result.draggableId.split("-")[1];
    this.exerciseDragged = null;
    this.source = {
      dayId: result.source.droppableId,
      index: result.source.index,
      exercises: null,
      day: null,
      dayIndex: null,
      week: null,
      weekIndex: null,
      phase: null,
      phaseIndex: null
    };
    this.destination = {
      dayId: result.destination.droppableId,
      index: result.destination.index,
      exercises: null,
      day: null,
      dayIndex: null,
      week: null,
      weekIndex: null,
      phase: null,
      phaseIndex: null
    };
  }

  newPhases() {
    this.extractInstanceVariables();
    debugger;
    updateSourceDay();
    updateDestinationDay();
    return newPhases;
  }

  extractInstanceVariables() {
    let currentPhase;
    let currentPhaseIndex;
    let currentWeek;
    let currentWeekIndex;

    this.phases.forEach((phase, index) => {
      currentPhase = phase;
      currentPhaseIndex = index;
      phase.weeks.forEach((week, index) => {
        currentWeek = week;
        currentWeekIndex = index;
        week.days.forEach((day, index) => {
          if (day.id == this.source.dayId) {
            day.exercises.forEach(exercise => {
              if (exercise.id == this.exerciseId) {
                this.exerciseDragged = exercise;
              }
            });
            this.source.exercises = day.exercises;
            this.source.day = day;
            this.source.dayIndex = index;
            this.source.week = currentWeek;
            this.source.weekIndex = currentWeekIndex;
            this.source.phase = currentPhase;
            this.source.phaseIndex = currentPhaseIndex;
          }
          else if (day.id == this.destination.dayId) {
            this.destination.exercises = day.exercises;
            this.destination.day = day;
            this.destination.dayIndex = index;
            this.destination.week = currentWeek;
            this.destination.weekIndex = currentWeekIndex;
            this.destination.phase = currentPhase;
            this.destination.phaseIndex = currentPhaseIndex;
          }
        });
      });
    });

  }

}
