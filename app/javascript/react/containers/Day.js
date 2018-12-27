import React from 'react';
import { Droppable } from 'react-beautiful-dnd';

import Exercise from '../components/Exercise'

const Day = props => {

  let exercises = props.exercises.map((exercise, index) => {
    return(
      <Exercise
        key = {exercise.id}
        id = {exercise.id}
        name = {exercise.name}
        day = {props.id}
        index = {index}
        description = {exercise.description}
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
          {exercises}
          {provided.placeholder}
        </div>
      )}
    </Droppable>
  )
}

export default Day;
