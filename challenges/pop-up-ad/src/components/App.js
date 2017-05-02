import React from 'react';
import AnnounceBox from './AnnounceBox.js'
import EmailForm from './EmailForm.js'

let title = "You have won tickets to see Taylor Swift!!";
let subTitle = "Please enter your email so we can send you the tickets";
let placeholder = "Your email here";
let buttonValue = "CLAIM YOUR PRIZE";
let warning = 'Are you sure?';

const App = props => {

  let handleFormSubmit = event => {
    event.preventDefault();
    console.log('Form was submitted');
  };

  let handleButtonClick = event => alert('Button was clicked');

  return (
    <div className="popupbox">
      <AnnounceBox title={title} subTitle={subTitle} warning={warning} />
      <EmailForm placeholder={placeholder} buttonValue={buttonValue} handleFormSubmit={handleFormSubmit} />
    </div>
  );
};

export default App;
