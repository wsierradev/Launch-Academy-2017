import React, { Component } from 'react';
import Answer from './Answer';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      chosenAnswerId: null
    }
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(id) {
    this.setState({ chosenAnswerId: id })
  }

  render() {
    let response
    let question = this.props.data.question.body;
    let answers = this.props.data.answers.map(answer => {
      let onClick = () => this.handleClick(answer.id);

      if (this.state.chosenAnswerId === answer.id) {
        if (answer.correct) {
          response = "Hells Yeah!";
        } else {
          response = "Nooope. Try again.";
        }
      }

      return(
        <Answer
          key={answer.id}
          id={answer.id}
          body={answer.body}
          onClick={onClick}
        />
      )
    });

    return (
      <div>
          <h1>{question}</h1>
          <ul>{answers}</ul>
          <h2>{response}</h2>
      </div>
    )
  }
}
export default App;
