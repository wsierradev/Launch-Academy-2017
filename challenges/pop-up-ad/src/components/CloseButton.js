import React from 'react';

let CloseButton = props => {

  return (
    <button onClick={
      event => {
        window.confirm(`${props.warning}`);
      }
    }><i className="fa fa-times" aria-hidden="true"></i></button>
  );
};

export default CloseButton;
