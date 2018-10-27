import React from 'react';

const AssessEnduro = props => {
  return(
    <div>
      <p>I'm the assessEnduro form hunk</p>
        <form onSubmit={props.handleSubmit} name="enduro">
          Yes:
          <br />
          <input type="radio" name="enduro" value="true"></input>
          <br />
          No:
          <br />
          <input type="radio" name="enduro" value="false"></input>
          <br />
          <input type="submit"></input>
        </form>
      <span onClick={props.nextStep}>nextStep</span>
      <span onClick={props.prevStep}>prevStep</span>
    </div>
  )
}

export default AssessEnduro;
