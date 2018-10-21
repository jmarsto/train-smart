import React, { Component } from 'react';

class Landing extends Component {
  constructor(props) {
    super(props);
    this.state = {
    }
  }

  render() {
    return(
      <div>
        <h1>hi from Landing</h1>
        <div>
          <p><strong>Step 1:</strong> Here we'll have an easy sign up form</p>
        </div>
        <div>
          <p>And the rest of the page will be easy to comprehend infographics</p>
          <p>i.e.</p>
          <p><strong>Step 2:</strong> Assess your ability</p>
          <p><strong>Step 3:</strong> Generate a training plan!</p>
        </div>
      </div>
    )
  }
}

export default Landing
