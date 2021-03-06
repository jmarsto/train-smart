import React from 'react';

const ProgressTile = props => {
  let classStatus = "progress-tile small-1 columns"

  if (props.id <= props.stepLimit) {
    classStatus += " selectable"
    if (props.id == props.selectedStep) {
      classStatus += " selected"
    }
  }

  return(
    <div className={classStatus} onClick={props.selectStep}>
      <p></p>
    </div>
  )
}

export default ProgressTile;
