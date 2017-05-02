import React from 'react';

let EmailForm = props => {
  return (
    <form
      onSubmit={props.handleFormSubmit}
    >
    <div className="row large-10 large-centered columns">
      <div className="input-group">
        <input className="input-group-field" type="text" placeholder={props.placeholder} />
        <div className="input-group-button">
          <input type="submit" className="button" value={props.buttonValue}/>
        </div>
      </div>
    </div>
    </form>
  )
};


export default EmailForm;
