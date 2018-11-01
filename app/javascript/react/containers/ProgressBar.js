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

  return(
    <div id="progress-bar" className="row">
      <div className="progress-tile back small-2 columns" onClick={props.prevStep}>Go Back</div>
      {progressTiles}
    </div>
  )
}

export default ProgressBar;
