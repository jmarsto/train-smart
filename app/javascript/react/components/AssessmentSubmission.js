import React from 'react';

const AssessmentSubmission = props => {
  return(
    <div className="assessment-tile">
      <span id="submit" onClick={props.submitAssessment}>Submit?</span>
      <br />
    </div>
  )
}

export default AssessmentSubmission;
