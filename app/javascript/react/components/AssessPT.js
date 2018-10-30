import React from 'react';

const AssessPT = props => {
  return(
    <div>
      <h4>Do you have a previous injury that affects your climbing?</h4>
      <form onSubmit={props.handleSubmit} name="pt" className="row">
        <div className="small-7 columns">
          Yes:
          <br />
          <input type="radio" name="pt" value="true"></input>
        </div>
        <div className="small-7 columns">
          No:
          <br />
          <input type="radio" name="pt" value="false"></input>
        </div>
        <input type="submit"></input>
      </form>
    </div>
  )
}

export default AssessPT;
