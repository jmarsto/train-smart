import React from 'react';

const AssessmentSubmission = props => {
  return(
    <div>
      <button onClick={props.submitAssessment}>Submit?</button>
      <br />
    </div>
  )
}

export default AssessmentSubmission;
