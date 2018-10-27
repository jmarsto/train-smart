import React from 'react';

const AssessPT = props => {
  return(
    <div>
      <p>PT?</p>
      <form onSubmit={props.handleSubmit} name="pt">
        Yes:
        <br />
        <input type="radio" name="pt" value="true"></input>
        <br />
        No:
        <br />
        <input type="radio" name="pt" value="false"></input>
        <br />
        <input type="submit"></input>
      </form>
      <span onClick={props.nextStep}>click</span>
    </div>
  )
}

export default AssessPT;
