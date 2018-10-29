import React, { Component } from 'react';
import 'babel-polyfill';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import Phase from './Phase'

class Profile extends Component {
  constructor(props) {
    super(props);
    this.state = {
      latestPlan: {
        phases: []
      }
    };
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

    let phases = this.state.latestPlan.phases.map((phase, index) => {
      return (
        <Phase
          key = {index}
          weeks = {phase.weeks}
           />
      )
    })
      // let planPhases = []
      // this.state.latestPlan.phases.forEach(phase => {
      //   let phaseWeeks = []
      //   phase.weeks.forEach(week => {
      //     let weekDays = []
      //     week.days.forEach(day => {
      //       weekDays.push(
              // <Day
              //   key = {day.id}
              //   id = {day.id}
              //   exercise = {day.exercise_name}
              //   description = {day.exercise_description}
              // />
      //       )
      //     })
      //     let weekDiv = <div className="week row">
      //       {weekDays}
      //     </div>
      //     phaseWeeks.push(weekDiv)
      //   })
      //   let phaseDiv = <div className="phase">
      //     {phaseWeeks}
      //   </div>
      //   planPhases.push(phaseDiv)
      // })
      // latestPlanDiv = <div className="plan">{planPhases}</div>
    return (
      <div>
        {phases}
      </div>
    )
  }
}

export default Profile
 
