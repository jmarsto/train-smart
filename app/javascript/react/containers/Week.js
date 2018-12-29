import React from 'react';
import Day from './Day'

const Week = props => {

  let days = props.days.map(day => {

    return (
      <Day
        key = {day.id}
        id = {day.id}
        workouts = {day.workouts}
      />
    )
  })

  return(
    <div className="week row">
      {days}
    </div>
  )
};

export default Week;
