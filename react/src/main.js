import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import CardList from './components/CardList';
import IndexList from './components/IndexList';

$(function() {
  if (document.getElementById('main-app')) {
    ReactDOM.render(
      <CardList />,
      document.getElementById('main-app')
    );
  };
});


$(function() {
  if (document.getElementById('index-app')) {
    ReactDOM.render(
      <IndexList />,
      document.getElementById('index-app')
    );
  };
});
