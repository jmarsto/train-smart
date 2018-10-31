import React from 'react';

const AssessmentTile = props => {
  return(
    <div>
      <h4>{props.prompt}</h4>
      <form onSubmit={props.handleSubmit} name={props.name} className="row" onChange={props.handleSelection}>
        <div className="small-7 columns">
          {props.labelTrue}
          <br />
          <input type="radio" name={props.name} value="true" checked={props.selection === true}></input>
        </div>
        <div className="small-7 columns">
          {props.labelFalse}
          <br />
          <input type="radio" name={props.name} value="false" checked={props.selection === false}></input>
        </div>
      </form>
    </div>
  )
}

export default AssessmentTile;
