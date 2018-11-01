import React, { Component } from 'react';
import Week from './Week'

const Phase = (props) => {

  let weeks = props.weeks.map(week => {
    return (
      <Week
        key = {week.id}
        id = {week.id}
        days = {week.days}
       />
    )
  })


  return (
    <div className={`phase-${props.id}`}>
      {weeks}
    </div>
  )
}

export default Phase;
