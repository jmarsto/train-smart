import React from 'react';

const AssessmentSubmission = props => {
  return(
    <div className="assessment-tile">
      <button onClick={props.submitAssessment}>Submit?</button>
      <br />
    </div>
  )
}

export default AssessmentSubmission;
