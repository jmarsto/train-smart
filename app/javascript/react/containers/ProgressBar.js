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
    <div className="progress-bar row">
      <button className="back small-2 columns" onClick={props.prevStep}>Go Back</button>
      {progressTiles}
    </div>
  )
}

export default ProgressBar;
