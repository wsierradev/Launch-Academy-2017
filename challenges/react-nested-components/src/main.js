// main.js
import './app.scss';
import React from 'react';
import ReactDOM from 'react-dom';
import IconGuide from './components/IconGuide';

let app = (
  <IconGuide />
);

ReactDOM.render(
  app,
  document.getElementById('app')
);
