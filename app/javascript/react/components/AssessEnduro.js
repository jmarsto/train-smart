import React from 'react';

const AssessEnduro = props => {
  return(
    <div>
      <h4>When projecting a route, which is the limiting factor?</h4>
        <form onSubmit={props.handleSubmit} name="enduro" className="row">
          <div className="small-7 columns">
            Endurance:
            <br />
            <input type="radio" name="enduro" value="true"></input>
          </div>
          <div className="small-7 columns">
            Technical Ability:
            <br />
            <input type="radio" name="enduro" value="false"></input>
          </div>
          <input type="submit"></input>
        </form>
    </div>
  )
}

export default AssessEnduro;
