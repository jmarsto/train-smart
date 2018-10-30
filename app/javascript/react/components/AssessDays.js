import React from 'react';

const AssessDays = props => {
  return(
    <div>
      <h4>Do you have MORE than 2-3 days a week to commit to training?</h4>
      <form onSubmit={props.handleSubmit} name="days" className="row">
        <div className="small-7 columns">
          Yes:
          <br />
          <input type="radio" name="days" value="true"></input>
        </div>
        <div className="small-7 columns">
          No:
          <br />
          <input type="radio" name="days" value="false"></input>
        </div>
        <input type="submit"></input>
      </form>
      <button className="back" onClick={props.prevStep}>Go Back</button>
    </div>
  )
}

export default AssessDays;
