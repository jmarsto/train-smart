import React, { Component } from 'react';
import Week from './Week'

const Phase = (props) => {

  let weeks = props.weeks.map((week, index) => {
    return (
      <Week
        key = {index}
        days = {week.days}
       />
    )
  })


  return (
    <div className="phase">
      {weeks}
    </div>
  )
}

export default Phase;
