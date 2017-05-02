import React from 'react';
import CloseButton from './CloseButton.js';

const AnnounceBox = (props) => {
  return (
    <div>
      <CloseButton warning={props.warning} handleClick={props.handleClick} />
      <div className="row messages">
        <div className="small-11">
          <h3 className='text-center'>{props.title}</h3>
          <h6 className='text-center'>{props.subTitle}</h6>
        </div>
      </div>
    </div>
  );
}

export default AnnounceBox;
