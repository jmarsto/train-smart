import React, { Component } from 'react';
import 'babel-polyfill';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import AssessPT from '../components/AssessPT';
import AssessCrusher from '../components/AssessCrusher';
import AssessDays from '../components/AssessDays';
import AssessEnduro from '../components/AssessEnduro';
import AssessmentSubmission from '../components/AssessmentSubmission';
import ProgressBar from './ProgressBar';

class Assessment extends Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedStep: 1,
      stepLimit: 1,
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
    this.increaseStepLimitIfNecessary = this.increaseStepLimitIfNecessary.bind(this)
    this.selectStep = this.selectStep.bind(this)
  }

  selectStep = (stepNum) => {
    if (stepNum <= this.state.stepLimit) {
      this.setState({ selectedStep: stepNum })
    }
  }

  nextStep = () => {
    let changingStep = this.state.selectedStep
    changingStep++
    this.setState({ selectedStep: changingStep })
  }

  prevStep = () => {
    let changingStep = this.state.selectedStep
    changingStep--
    this.setState({ selectedStep: changingStep })
  }

  increaseStepLimitIfNecessary = (event) => {
    if (this.state.selectedStep == this.state.stepLimit) {
      let changingLimit = this.state.stepLimit
      changingLimit++
      this.setState({ stepLimit: changingLimit })
    }
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
    this.increaseStepLimitIfNecessary(event);
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
      switch (this.state.selectedStep) {
        case 1:
          return <AssessPT
            handleSubmit = {this.handleStepSubmission}
          />
        case 2:
          return <AssessCrusher
            handleSubmit = {this.handleStepSubmission}
          />
        case 3:
          return <AssessDays
            handleSubmit = {this.handleStepSubmission}
          />
        case 4:
          return <AssessEnduro
            handleSubmit = {this.handleStepSubmission}
          />
        case 5:
          return <AssessmentSubmission
            submitAssessment = {this.handleAssessmentSubmission}
          />
      }
    }

    return (
      <div>
        <ProgressBar
          prevStep = {this.prevStep}
          selectedStep = {this.state.selectedStep}
          stepLimit = {this.state.stepLimit}
          selectStep = {this.selectStep}
        />
        <div className="assessment">
          {assessmentStep()}
        </div>
      </div>
    )
  }
}

export default Assessment
 
