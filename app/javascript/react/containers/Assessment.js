import React, { Component } from 'react';
import 'babel-polyfill';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import AssessPT from '../components/AssessPT';
import AssessCrusher from '../components/AssessCrusher';
import AssessDays from '../components/AssessDays';
import AssessEnduro from '../components/AssessEnduro';
import AssessmentSubmission from '../components/AssessmentSubmission';

class Assessment extends Component {
  constructor(props) {
    super(props);
    this.state = {
      step: 1,
      pt: null,
      crusher: null,
      days: null,
      enduro: null
    };
    this.nextStep = this.nextStep.bind(this)
    this.prevStep = this.prevStep.bind(this)
    this.handleStepSubmission = this.handleStepSubmission.bind(this)
    this.handleAssessmentSubmission = this.handleAssessmentSubmission.bind(this)
    this.postAssessment = this.postAssessment.bind(this)
  }

  nextStep = () => {
    let changingStep = this.state.step
    changingStep++
    this.setState({ step: changingStep })
  }

  prevStep = () => {
    let changingStep = this.state.step
    changingStep--
    this.setState({ step: changingStep })
  }

  handleStepSubmission = (event) => {
    event.preventDefault();
    let formName = event.target.name
    let value
    if (event.target[formName].value === "true") {
      value = true
    }
    else {
      value = false
    }
    this.nextStep();
    this.setState({ [event.target.name]: value })
  }

  postAssessment = (payload) => {
    fetch(`/api/v1/assessments.json`, {
      method: 'POST',
      body: JSON.stringify(payload),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json' },
      credentials: 'same-origin'
    })
    .then(response => {
      if (response.ok) {
        browserHistory.push('/profile')
      } else {
        return response.json()
        .then(response => {
          return response.errors
        })
        .then(errors => {
          console.log(errors);
        })
        .catch(console.log("Error in submitting form"))
      }
    })
  }

  handleAssessmentSubmission = (event) => {
    event.preventDefault();
    let payload = {
      pt: this.state.pt,
      crusher: this.state.crusher,
      days: this.state.days,
      enduro: this.state.enduro
    }
    this.postAssessment(payload)
  }

  render() {
    let assessmentStep = () => {
      switch (this.state.step) {
        case 1:
          return <AssessPT
            handleSubmit = {this.handleStepSubmission}
          />
        case 2:
          return <AssessCrusher
            prevStep = {this.prevStep}
            handleSubmit = {this.handleStepSubmission}
          />
        case 3:
          return <AssessDays
            prevStep = {this.prevStep}
            handleSubmit = {this.handleStepSubmission}
          />
        case 4:
          return <AssessEnduro
            prevStep = {this.prevStep}
            handleSubmit = {this.handleStepSubmission}
          />
        case 5:
          return <AssessmentSubmission
            submitAssessment = {this.handleAssessmentSubmission}
            prevStep = {this.prevStep}
          />
      }
    }

    return (
      <div>
        <div className="assessment">
          {assessmentStep()}
        </div>
      </div>
    )
  }
}

export default Assessment
 
