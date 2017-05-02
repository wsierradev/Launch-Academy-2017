import React from 'react';
import Question from './Question.js';

class QuestionList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {questionClickedID: null};

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(id) {
    let questionID = id;
    if(id === this.state.questionClickedID) {
      questionID = null;
    }
    this.setState({questionClickedID: questionID});
  };

  render() {
    let questionList = this.props.questions.map(question=>{
      let selected;
      if(question.id === this.state.questionClickedID){
        selected = true;
      }

      let onQuestionClick = () =>
        this.handleClick(question.id);

      return (
        <Question
          key={question.id}
          question={question.question}
          answer={question.answer}
          selected={selected}
          handleClick={onQuestionClick}
        />
      );
    });

      return (
        <ul> {questionList}</ul>
      );
    }
};

export default QuestionList;
