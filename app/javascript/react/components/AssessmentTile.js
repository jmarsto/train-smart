import React from 'react';

const AssessmentTile = props => {
  let unchecked = "far fa-square icon-3x"
  let checked = "far fa-check-square icon-3x"
  let trueBox, falseBox, hoveredBox;

  props.selection ? trueBox = checked : trueBox = unchecked
  props.selection === false ? falseBox = checked : falseBox = unchecked

  let handleChoice = (event) => {
    let selectedValue = event.target.parentElement.id
    props.handleSelection(props.name, selectedValue)
  };

  let hoverSelection = (event) => {
    hoveredBox = event.target.classList.value
    event.target.classList.value = checked
  };

  let unhoverSelection = (event) => {
    if (hoveredBox) {
      event.target.classList.value = hoveredBox
    }
  };

  return(
    <div key={props.name} className="assessment-tile">
      <h4 className="prompt">{props.prompt}</h4>
      <form name={props.name} className="form row" >
        <div className="small-7 columns">
          <div className="form-label">
            {props.labelTrue}
          </div>
          <br />
          <div id="true" onClick={handleChoice}>
            <i
              className={trueBox}
              onMouseEnter={hoverSelection}
              onMouseLeave={unhoverSelection}
             />
          </div>
        </div>
        <div className="small-7 columns">
          <div className="form-label">
            {props.labelFalse}
          </div>
          <br />
          <div id="false" onClick={handleChoice}>
            <i
              className={falseBox}
              onMouseEnter={hoverSelection}
              onMouseLeave={unhoverSelection}
             />
          </div>
        </div>
      </form>
    </div>
  )
}

export default AssessmentTile;
