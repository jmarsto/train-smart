import React from 'react';

const AssessDays = props => {
  return(
    <div>
      <p>I'm the assessDays form hunk</p>
      <form onSubmit={props.handleSubmit} name="days">
        Yes:
        <br />
        <input type="radio" name="days" value="true"></input>
        <br />
        No:
        <br />
        <input type="radio" name="days" value="false"></input>
        <br />
        <input type="submit"></input>
      </form>
      <span onClick={props.nextStep}>nextStep</span>
      <span onClick={props.prevStep}>prevStep</span>
    </div>
  )
}

export default AssessDays;
