import React from 'react';

const Question = props => {

  let answerDiv;
  let answerShower = props => {
    if(props.selected){
      answerDiv = <div className="answer">{props.answer}</div>;
    }
    return answerDiv;
  }

  let buttonThing
  let buttonShower = props => {
    if (props.selected){
      buttonThing = <i className="fa fa-minus-square fa-2x" aria-hidden="true" key={props.id} onClick={props.handleClick}/>
    } else {
      buttonThing = <i className="fa fa-plus-square fa-2x" aria-hidden="true"  key={props.id} onClick={props.handleClick}/>
    }
    return buttonThing
  }

  return (
    <div className="container">
      {buttonShower(props)}
      <div className="question"> {props.question} </div>
      {answerShower(props)}
      <hr></hr>
    </div>
  );
};

export default Question;
