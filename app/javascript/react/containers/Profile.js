import React, { Component } from 'react';
import 'babel-polyfill';
import { Router, Route, IndexRoute, Link, browserHistory } from 'react-router';
import Phase from './Phase';

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

    let phases = this.state.latestPlan.phases.map(phase => {
      return (
        <Phase
          name = {phase.name}
          key = {phase.id}
          id = {phase.id}
          weeks = {phase.weeks}
           />
      )
    })

    return (
      <div className="profile">
        <div className="plan">
          {phases}
        </div>
        <div className="sidebar">
          <Link to='/edit'>
            <i className="fas fa-user-edit"></i>
          </Link>
        </div>
      </div>
    )
  }
}

export default Profile
 
