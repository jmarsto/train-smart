import React from 'react';

const AssessmentSubmission = props => {
  return(
    <div className="assessment-tile">
      <div id="submit" onClick={props.submitAssessment}>Submit?</div>
      <br />
    </div>
  )
}

export default AssessmentSubmission;
