import React from 'react';
import Exercise from '../components/Exercise'

const Day = props => {

  let exercises = props.exercises.map(exercise => {
    return(
      <Exercise
        key = {exercise.id}
        name = {exercise.name}
        description = {exercise.description}
      />
    )
  })

  return(
    <div className="day small-2 columns">
      <span>{exercises}</span>
    </div>
  )
}

export default Day;
