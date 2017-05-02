import React, { Component } from 'react';

let wait = (milliseconds) => {
  let startTime = new Date().getTime()
  var currentTime = startTime
  while (currentTime < startTime + milliseconds) {
    currentTime = new Date().getTime()
  }
}

class Picture extends Component {
  constructor(props) {
    super(props);
    this.state = {
      clean: true
    };

    this.handleCleanGlassClick = this.handleCleanGlassClick.bind(this);
    this.handleTouchGlassClick = this.handleTouchGlassClick.bind(this);
  }

  handleCleanGlassClick() {
    this.setState({ clean: true });
  }

  handleTouchGlassClick() {
    this.setState({ clean: false });
  }

  render() {
    let cleanText = this.state.clean ? "clean" : "dirty";
    let levelText = (this.props.straightenCount % 2 == 0) ? "level" : "crooked";

    return(
      <div>
        <h1>I am a mounted picture component!</h1>
        <p>The picture has been straightened {this.props.straightenCount} times</p>
        <p>The picture is {cleanText} and {levelText}</p>
        <button onClick={this.handleCleanGlassClick}>Clean Glass</button>
        <button onClick={this.handleTouchGlassClick}>Touch Glass</button>
      </div>
    );
  }
}

export default Picture;
