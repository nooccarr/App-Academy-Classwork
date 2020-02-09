import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { receiveTodos, receiveTodo } from "./actions/todo_actions";
import App from './components/app';
import Root from './components/root';


document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Root />, document.getElementById('root'))

})

window.store = configureStore;  // for development only!
window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;