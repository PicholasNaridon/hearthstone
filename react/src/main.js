import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import CardList from './components/CardList';

$(function() {
  if (document.getElementById('main-app')) {
    ReactDOM.render(
      <CardList />,
      document.getElementById('main-app')
    );
  };
});
