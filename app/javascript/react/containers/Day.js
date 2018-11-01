import React from 'react';

const Day = props => {

  return(
    <div className="day small-2 columns">
      <span className="day-number">{props.id}</span>
      <span>{props.exercise}</span>
    </div>
  )
}

export default Day;
