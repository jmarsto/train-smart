import React from 'react';

const AssessmentSubmission = props => {
  return(
    <div>
      <button onClick={props.submitAssessment}>Submit?</button>
    </div>
  )
}

export default AssessmentSubmission;
