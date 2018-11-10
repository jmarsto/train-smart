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

  let phaseName = () => {
    switch (props.name) {
      case "BF":
        return ("Base Fitness")
      case "HB":
        return ("Strength")
      case "POW":
        return ("Power")
      case "PE":
        return ("Power Endurance")
    }
  }


  return (
    <div className={`phase-${props.name}`}>
      <div className="phase-name row">
        {phaseName()}
      </div>
      {weeks}
    </div>
  )
}

export default Phase;
