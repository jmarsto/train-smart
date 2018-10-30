import React from 'react';

const Day = props => {

  return(
    <div className="day small-2 columns">
      <p>{props.id}</p>
      <p>{props.exercise}</p>
    </div>
  )
}

export default Day;