import { RECEIVE_SESSION_ERRORS, RECEIVE_CURRENT_USER } from '../actions/session_actions';

export default (state = [], action) => {
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      const newState = [];
      return newState;
    case RECEIVE_SESSION_ERRORS:
      const errState = state.slice();
      errState.concat(action.errors);
      return errState;
    default:
      return state;
  }
};

