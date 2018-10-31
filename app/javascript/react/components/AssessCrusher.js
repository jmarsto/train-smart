import React from 'react';

const AssessCrusher = props => {
  return(
    <div>
      <h4>Have you ever sent 5.12 or V6?</h4>
        <form onSubmit={props.handleSubmit} name="crusher" className="row">
          <div className="small-7 columns">
            Yes:
            <br />
            <input type="radio" name="crusher" value="true"></input>
          </div>
          <div className="small-7 columns">
            No:
            <br />
            <input type="radio" name="crusher" value="false"></input>
          </div>
        <input type="submit"></input>
        </form>
    </div>
  )
}

export default AssessCrusher;
