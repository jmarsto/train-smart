import React from 'react';
import { Droppable } from 'react-beautiful-dnd';

import Exercise from '../components/Exercise'

const Day = props => {

  let workouts = props.workouts.map((workout, index) => {
    return(
      <Exercise
        key = {workout.id}
        id = {workout.id}
        name = {workout.exercise.name}
        index = {index}
        description = {workout.exercise.description}
      />
    )
  })

  return(
    <Droppable droppableId={`${props.id}`}>
      {(provided) => (
        <div
          className="day small-2 columns"
          ref={provided.innerRef}
          {...provided.droppableProps}
        >
          {workouts}
          {provided.placeholder}
        </div>
      )}
    </Droppable>
  )
}

export default Day;
