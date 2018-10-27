import React from 'react';

const AssessCrusher = props => {
  return(
    <div>
      <p>I'm the assessCrusher form hunk</p>
        <form onSubmit={props.handleSubmit} name="crusher">
          Yes:
          <br />
          <input type="radio" name="crusher" value="true"></input>
          <br />
          No:
          <br />
          <input type="radio" name="crusher" value="false"></input>
          <br />
          <input type="submit"></input>
        </form>
      <span onClick={props.nextStep}>nextStep</span>
      <span onClick={props.prevStep}>prevStep</span>
    </div>
  )
}

export default AssessCrusher;
