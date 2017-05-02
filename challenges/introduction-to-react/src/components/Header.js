import React from 'react';

class Header extends React.Component {
  render() {
    let text = 'I am a React element! Hear me roar!';

    return(
      <h1 id="special-header" className="header" onClick={event => alert('Roar!')}>
        {text}
      </h1>
    );
  }
};

export default Header;
