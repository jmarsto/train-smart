import React from 'react';
import ProgressTile from '../components/ProgressTile'

const ProgressBar = props => {
  let progressTiles = [];


  for (let i = 0; i < 5; i++) {
    let stepNumber = i + 1
    let handleClick = () => {
      props.selectStep(stepNumber)
    }

    progressTiles.push(
      <ProgressTile
        selectStep = {handleClick}
        key = {stepNumber}
        id = {stepNumber}
        selectedStep = {props.selectedStep}
        stepLimit = {props.stepLimit}
      />
    )
  }

  let nextStep = () => {
    if (props.selectedStep < props.stepLimit) {
      props.nextStep()
    }
  }

  return(
    <div id="progress-bar" className="row">
      <div className="progress-tile back small-2 columns" onClick={props.prevStep}>
        <i className="fa fa-angle-double-left" aria-hidden="true"></i>
      </div>
      {progressTiles}
      <div className="progress-tile back small-2 columns" onClick={nextStep}>
        <i className="fas fa-angle-double-right"></i>
      </div>
    </div>
  )
}

export default ProgressBar;
