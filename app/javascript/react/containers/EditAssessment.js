import React, { Component } from 'react';
import 'babel-polyfill';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import AssessmentTile from '../components/AssessmentTile';

class EditAssessment extends Component {
  constructor(props) {
    super(props);
    this.state = {
      pt: null,
      crusher: null,
      days: null,
      enduro: null
    };
    this.handleAssessmentSelection = this.handleAssessmentSelection.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.saveUpdates = this.saveUpdates.bind(this);
  }

  componentDidMount() {
    fetch('api/v1/assessments')
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`;
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(assessment => {
      this.setState({
        id: assessment.id,
        pt: assessment.pt,
        crusher: assessment.crusher,
        days: assessment.days,
        enduro: assessment.enduro
      });
    });
  }

  saveUpdates = (payload) => {
    fetch(`/api/v1/assessments/${this.state.id}`, {
      method: 'PATCH',
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
        console.log("error in fetch patch");
      }
    })
  }

  handleSubmit = (event) => {
    let accept = confirm("Are you sure you want to update your assessment? This will likely alter your plan")
    if (accept == true) {
      let payload = {
        pt: this.state.pt,
        crusher: this.state.crusher,
        days: this.state.days,
        enduro: this.state.enduro
      }
      this.saveUpdates(payload);
    } else {
      console.log("update prevented");
    }
  }


  handleAssessmentSelection = (fieldName, selectedValue) => {
    let setValue = selectedValue === "true"
    this.setState({ [fieldName]: setValue })
  }

  render() {
    return(
      <div className="edit">
        <div className="assessment">
          <AssessmentTile
            name = "pt"
            prompt = "Do you have a previous injury that affects your climbing?"
            handleSelection = {this.handleAssessmentSelection}
            selection = {this.state.pt}
            labelTrue = "Yes"
            labelFalse = "No"
          />
          <AssessmentTile
            name = "crusher"
            prompt = "Have you ever sent 5.12 or V6?"
            handleSelection = {this.handleAssessmentSelection}
            selection = {this.state.crusher}
            labelTrue = "Yes"
            labelFalse = "No"
          />
          <AssessmentTile
            name = "days"
            prompt = "Do you have MORE than 2-3 days a week to commit to training?"
            handleSelection = {this.handleAssessmentSelection}
            selection = {this.state.days}
            labelTrue = "Yes"
            labelFalse = "No"
          />
          <AssessmentTile
            name = "enduro"
            prompt = "When projecting a route, which is the limiting factor?"
            handleSelection = {this.handleAssessmentSelection}
            selection = {this.state.enduro}
            labelTrue = "Endurance"
            labelFalse = "Technical Ability"
          />
          <span id="submit" onClick={this.handleSubmit}>Submit</span>
        </div>
      </div>
    )
  }
}

export default EditAssessment
