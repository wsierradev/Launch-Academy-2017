import React from 'react'

const Answer = props => {

  return (
    <div onClick={props.onClick}>
      <li><button type="button">{props.body}</button></li>
    </div>
  )
}

export default Answer;
