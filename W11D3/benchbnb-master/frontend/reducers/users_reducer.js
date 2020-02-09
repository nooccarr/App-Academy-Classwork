import { RECEIVE_CURRENT_USER } from '../actions/session_actions';

const preloadedState = {};

export default (state = preloadedState, action) => {
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      // debugger
      return Object.assign({}, state, { [action.currentUser.id]: action.currentUser });
    default: 
      return state;
  }
}

