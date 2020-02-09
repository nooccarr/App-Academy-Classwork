import * as apiUtil from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

export const receiveCurrentUser = (currentUser) => {
  return {
    type: RECEIVE_CURRENT_USER,
    currentUser: currentUser
  };
}; 

export const logoutCurrentUser = () => {
  return {
    type: LOGOUT_CURRENT_USER
  };
};

export const receiveErrors = (errors) => {
  return {
    type: RECEIVE_SESSION_ERRORS,
    errors: errors
  };
};

export const login = (user) => {
  return (dispatch) => {
    return apiUtil.login(user).then( 
      (user) => { dispatch(receiveCurrentUser(user)); }, 
      (errors) => { dispatch(receiveErrors(errors)); }
    );
  };
};

export const logout = () => {
  return (dispatch) => {
    return apiUtil.logout().then( () => {
      dispatch( logoutCurrentUser() );
    });
  };
};

export const signup = (user) => {
  return (dispatch) => {
    return apiUtil.signup(user).then(
      (user) => { dispatch(receiveCurrentUser(user)); },
      (errors) => { dispatch(receiveErrors(errors)); }
    );
  };
};