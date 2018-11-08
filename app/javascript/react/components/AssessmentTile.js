import React from 'react';

const AssessmentTile = props => {
  let unchecked = "far fa-square icon-3x"
  let checked = "far fa-check-square icon-3x"
  let trueBox, falseBox;

  props.selection ? trueBox = checked : trueBox = unchecked
  props.selection === false ? falseBox = checked : falseBox = unchecked

  let handleChoice = (event) => {
    let selectedValue = event.target.parentElement.id
    props.handleSelection(props.name, selectedValue)
  };

  return(
    <div className="assessment-tile">
      <h4 className="prompt">{props.prompt}</h4>
      <form name={props.name} className="form row" >
        <div className="small-7 columns">
          {props.labelTrue}
          <br />
          <div id="true" onClick={handleChoice}>
            <i
              className={trueBox}
             />
          </div>
        </div>
        <div className="small-7 columns">
          {props.labelFalse}
          <br />
          <div id="false" onClick={handleChoice}>
            <i
              className={falseBox}
             />
          </div>
        </div>
      </form>
    </div>
  )
}

export default AssessmentTile;
