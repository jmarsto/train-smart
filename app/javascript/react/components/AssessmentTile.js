import React from 'react';

const AssessmentTile = props => {
  return(
    <div>
      <h4>{props.prompt}</h4>
      <form name={props.name} className="row" >
        <div className="small-7 columns">
          {props.labelTrue}
          <br />
          <input type="radio" name={props.name} value="true" checked={props.selection === true} onChange={props.handleSelection}></input>
        </div>
        <div className="small-7 columns">
          {props.labelFalse}
          <br />
          <input type="radio" name={props.name} value="false" checked={props.selection === false} onChange={props.handleSelection}></input>
        </div>
      </form>
    </div>
  )
}

export default AssessmentTile;
