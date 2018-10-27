import React, { Component } from 'react';
import 'babel-polyfill';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

class Profile extends Component {
  constructor(props) {
    super(props);
    this.state = {
      user: null,
      assessments: [],
      latestAssessment: null,
      plans: [],
      latestPlan: null
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
        user: data.user,
        assessments: data.assessments,
        latestAssessment: data.assessments.pop(),
        plans: data.plans,
        latestPlan: data.plans.pop()
      })
    })
  }

  render() {
    let latestAssessment
    if (this.state.latestAssessment) {
      latestAssessment = <div>
        <p>Latest Assessment:</p>
        <p>PT: {`${this.state.latestAssessment.pt}`}</p>
        <p>Crusher: {`${this.state.latestAssessment.crusher}`}</p>
        <p>Days: {`${this.state.latestAssessment.days}`}</p>
        <p>Enduro: {`${this.state.latestAssessment.enduro}`}</p>
      </div>
    }

    return (
      <div>
        {latestAssessment}
      </div>
    )
  }
}

export default Profile
 
