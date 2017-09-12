import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './containers/App';

$(function() {
  ReactDOM.render(
    <h3>Hi</h3>,
    document.getElementById('app')
  );
});
