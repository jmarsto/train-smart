import React, { Component } from 'react';
import 'babel-polyfill';
import { Router, Route, IndexRoute, Link, browserHistory } from 'react-router';
import { DragDropContext } from 'react-beautiful-dnd';

import Phase from './Phase';

class Profile extends Component {
  constructor(props) {
    super(props);
    this.state = {
      latestPlan: {
        phases: []
      }
    };
    this.updatePlanInState = this.updatePlanInState.bind(this)
  }

  updatePlanInState = (result) => {
    let planUpdater = new makeShitUp(this.state.latestPlan.phases, result.source, result.destination)
    this.setState({
      latestPlan: {
        ...this.state.latestPlan,
        phases: planUpdater.updatePhases()
      }
    })


    let sourceDayId = result.source.droppableId
    let sourceIndex = result.source.index
    let destinationDayId = result.destination.droppableId
    let destinationIndex = result.destination.index
    let exerciseId = result.draggableId.split("-")[1]

    if (!result.destination) {
      return
    }

    if (destinationDayId === sourceDayId && destinationIndex === sourceIndex) {
      return
    }

    let exerciseDragged
    let newSourceExercises
    let sourceDay
    let sourceDayIndex
    let sourceWeek
    let sourceWeekIndex
    let sourcePhase
    let sourcePhaseIndex
    let newDestinationExercises

    let currentPhase
    let currentPhaseIndex
    let currentWeek
    let currentWeekIndex

    this.state.latestPlan.phases.forEach((phase, index) => {
      currentPhase = phase
      currentPhaseIndex = index
      phase.weeks.forEach((week, index) => {
        currentWeek = week
        currentWeekIndex = index
        week.days.forEach((day, index) => {
          if (day.id == sourceDayId) {
            day.exercises.forEach(exercise => {
              if (exercise.id == exerciseId) {
                exerciseDragged = exercise
              }
            })
            newSourceExercises = day.exercises.filter(exercise => exercise.id != exerciseId)
            sourceDay = day
            sourceDayIndex = index
            sourceWeek = currentWeek
            sourceWeekIndex = currentWeekIndex
            sourcePhase = currentPhase
            sourcePhaseIndex = currentPhaseIndex
          }
        else if (day.id == destinationDayId && exerciseDragged) {
          newDestinationExercises = day.exercises.concat(exerciseDragged)
        }
        else if (day.id == destinationDayId && !exerciseDragged) {

        }
        })
      })
    })


    let destinationDay
    let destinationDayIndex
    let destinationWeek
    let destinationWeekIndex
    let destinationPhase
    let desinationPhaseIndex

    this.state.latestPlan.phases.forEach((phase, index) => {
      currentPhase = phase
      currentPhaseIndex = index
      phase.weeks.forEach((week, index) => {
        currentWeek = week
        currentWeekIndex = index
        week.days.forEach((day, index) => {
          if (day.id == destinationDayId) {
            newDestinationExercises = day.exercises.concat(exerciseDragged)
            destinationDay = day
            destinationDayIndex = index
            destinationWeek = currentWeek
            destinationWeekIndex = currentWeekIndex
            destinationPhase = currentPhase
            desinationPhaseIndex = currentPhaseIndex
          }
        })
      })
    })

    debugger


    let newSourceDay = {
      ...sourceDay,
      exercises: newSourceExercises
    }

    let newSourceDays = {
      ...sourceWeek.days,
      [sourceDayIndex]: newSourceDay
    }

    let newSourceWeek = {
      ...sourceWeek,
      days: newSourceDays
    }

    let newSourceWeeks = {
      ...sourcePhase.weeks,
      [sourceWeekIndex]: newSourceWeek
    }

    let newSourcePhase = {
      ...sourcePhase,
      weeks: newSourceWeeks
    }


    let newDestinationDay = {
      ...destinationDay,
      exercises: newDestinationExercises
    }

    let newDestinationDays = {
      ...destinationWeek.days,
      [destinationDayIndex]: newDestinationDay
    }

    let newDestinationWeek = {
      ...destinationWeek,
      days: newDestinationDays
    }

    let newDestinationWeeks = {
      ...destinationPhase.weeks,
      [destinationWeekIndex]: newDestinationWeek
    }

    let newDestinationPhase = {
      ...destinationPhase,
      weeks: newDestinationWeeks
    }

    let newPhases = this.state.latestPlan.phases

    // pull that phase out of phases and replace it
    newPhases.splice(sourcePhaseIndex, 1, newSourcePhase)
    newPhases.splice(destinationPhaseIndex, 1, newDestinationPhase)

    let updatedPlan = {
      ...this.state.latestPlan,
      phases: newPhases
    }

  }

  onDragEnd = result => {
    let sourceDayId = result.source.droppableId
    let destinationDayId = result.destination.droppableId
    let exerciseId = result.draggableId.split("-")[1]

    this.updatePlanInState(result)

    fetch(`/api/v1/programs/${this.state.latestPlan.id}`, {
      method: 'PATCH',
      body: JSON.stringify({sourceDayId, destinationDayId, exerciseId}),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json' },
      credentials: 'same-origin'
    })
    .then(response => {
      if (response.ok) {
        return
      } else {
        return response.json()
        .then(response => {
          return response.errors
        })
        .then(errors => {
          console.log(errors);
        })
        .catch(console.log("Error in fetch"))
      }
    })
  }

  componentDidMount() {
    fetch('/api/v1/programs')
    .then(response => {
      if (response.ok) {
        return response
      } else {
        let errorMessage = `${response.status} (${response.statusText})`
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(data => {
      this.setState({
        latestPlan: data
      })
    })
  }

  render() {
    let latestAssessment
    let latestPlanDiv

    let phases = this.state.latestPlan.phases.map(phase => {
      return (
        <Phase
          name = {phase.name}
          key = {phase.id}
          id = {phase.id}
          weeks = {phase.weeks}
           />
      )
    })

    return (
      <DragDropContext onDragEnd={this.onDragEnd}>
        <div className="profile">
          <div className="plan">
            <div className="week row week-labels">
              <div className="small-2 columns">Sunday</div>
              <div className="small-2 columns">Monday</div>
              <div className="small-2 columns">Tuesday</div>
              <div className="small-2 columns">Wednesday</div>
              <div className="small-2 columns">Thursday</div>
              <div className="small-2 columns">Friday</div>
              <div className="small-2 columns">Saturday</div>
            </div>
            {phases}
          </div>
          <div className="sidebar">
            <Link to='/edit'>
              <i className="fas fa-user-edit"></i>
            </Link>
          </div>
        </div>
      </DragDropContext>
    )
  }
}

export default Profile
 
