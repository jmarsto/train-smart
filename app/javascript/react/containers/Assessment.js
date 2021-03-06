import React, { Component } from 'react';
import 'babel-polyfill';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import AssessmentTile from '../components/AssessmentTile';
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
      enduro: null,
      trainable: null,
      static: null,
      mental: null,
      flexible: null,
      tendonitis: null
    };
    this.nextStep = this.nextStep.bind(this)
    this.prevStep = this.prevStep.bind(this)
    this.postAssessment = this.postAssessment.bind(this)
    this.increaseStepLimitIfNecessary = this.increaseStepLimitIfNecessary.bind(this)
    this.selectStep = this.selectStep.bind(this)
    this.handleAssessmentSelection = this.handleAssessmentSelection.bind(this)
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
    if (this.state.selectedStep > 1) {
      let changingStep = this.state.selectedStep
      changingStep--
      this.setState({ selectedStep: changingStep })
    }
  }

  increaseStepLimitIfNecessary = () => {
    if (this.state.selectedStep == this.state.stepLimit) {
      let changingLimit = this.state.stepLimit
      changingLimit++
      this.setState({ stepLimit: changingLimit })
    }
  }

  handleAssessmentSelection = (fieldName, selectedValue) => {
    let setValue = selectedValue === "true"
    this.increaseStepLimitIfNecessary()
    this.nextStep();
    this.setState({ [fieldName]: setValue })
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
    if (!this.state.trainable) {
      let confirmString = "You have answered 'no' to climbing 5.10. The best practice"
      confirmString += " you can get is through simply climbing. Focus on low intensity volume,"
      confirmString += " and pick up movement skills and base fitness.  When you can regularly"
      confirmString += " climb 5.10, come back and we'll get more specific. The training program that "
      confirmString += "follows is an example of what one might look like for you."
      confirm(confirmString)
    }
    let payload = {
      pt: this.state.pt,
      crusher: this.state.crusher,
      days: this.state.days,
      enduro: this.state.enduro,
      trainable: this.state.trainable,
      static: this.state.static,
      mental: this.state.mental,
      flexible: this.state.flexible,
      tendonitis: this.state.tendonitis
    }
    this.postAssessment(payload)
  }

  render() {
    let assessmentStep = () => {
      switch (this.state.selectedStep) {
        case 1:
          return <AssessmentTile
            name = "trainable"
            prompt = "Can you climb 5.10?"
            handleSelection = {this.handleAssessmentSelection}
            selection = {this.state.trainable}
            labelTrue = "Yes"
            labelFalse = "No"
          />
        case 2:
          return <AssessmentTile
            name = "days"
            prompt = "Do you have MORE than 2-3 days a week to commit to training?"
            handleSelection = {this.handleAssessmentSelection}
            selection = {this.state.days}
            labelTrue = "Yes"
            labelFalse = "No"
          />
        case 3:
          return <AssessmentTile
            name = "pt"
            prompt = "Do you have a previous injury that affects your climbing?"
            handleSelection = {this.handleAssessmentSelection}
            selection = {this.state.pt}
            labelTrue = "Yes"
            labelFalse = "No"
          />
        case 4:
          return <AssessmentTile
            name = "static"
            prompt = "Your style: slow and cautious, or quick and scrappy?"
            handleSelection = {this.handleAssessmentSelection}
            selection = {this.state.static}
            labelTrue = "Static"
            labelFalse = "Dynamic"
          />
        case 5:
          return <AssessmentTile
            name = "mental"
            prompt = "Go for it and maybe fall, or call 'take'?"
            handleSelection = {this.handleAssessmentSelection}
            selection = {this.state.mental}
            labelTrue = "Go for it"
            labelFalse = "Take"
          />
        case 6:
          return <AssessmentTile
            name = "crusher"
            prompt = "Have you ever sent 5.12 or V6?"
            handleSelection = {this.handleAssessmentSelection}
            selection = {this.state.crusher}
            labelTrue = "Yes"
            labelFalse = "No"
          />
        case 7:
          return <AssessmentTile
            name = "flexible"
            prompt = "Is flexibility often an obstacle on harder climbs?"
            handleSelection = {this.handleAssessmentSelection}
            selection = {this.state.flexible}
            labelTrue = "No"
            labelFalse = "Yes"
          />
        case 8:
          return <AssessmentTile
            name = "tendonitis"
            prompt = "Are you affected by tendonitis?"
            handleSelection = {this.handleAssessmentSelection}
            selection = {this.state.tendonitis}
            labelTrue = "Yes"
            labelFalse = "No"
          />
        case 9:
          return <AssessmentTile
            name = "enduro"
            prompt = "When projecting a route, which is the limiting factor?"
            handleSelection = {this.handleAssessmentSelection}
            selection = {this.state.enduro}
            labelTrue = "Endurance"
            labelFalse = "Technical Ability"
          />
        case 10:
          return <AssessmentSubmission
            submitAssessment = {this.handleAssessmentSubmission}
          />
      }
    }

    return (
      <div>
        <ProgressBar
          nextStep = {this.nextStep}
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
 
