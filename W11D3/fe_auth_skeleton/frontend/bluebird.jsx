import React from 'react';
import ReactDOM from 'react-dom';
import createStore from './store/store';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  let preloadedState = undefined;   // make sure we have variable we could use
  if (window.currentUser) {         // keeps user logged in after refreshing a page
    preloadedState = {
      session: {
        currentUser: window.currentUser
      }
    };
  }
  const store = createStore(preloadedState);
  // const store = createStore();

  ReactDOM.render(<Root store={store} />, root);
})