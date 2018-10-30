import React from 'react';

const AssessmentSubmission = props => {
  return(
    <div>
      <button onClick={props.submitAssessment}>Submit?</button>
      <br />
      <button className="back" onClick={props.prevStep}>Go Back</button>
    </div>
  )
}

export default AssessmentSubmission;
