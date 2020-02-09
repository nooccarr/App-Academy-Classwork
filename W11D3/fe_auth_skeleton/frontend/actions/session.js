// import actions created
import {            
    postUser, 
    postSession, 
    deleteSession 
} from '../utils/session';

// avoid failing silently
export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';


const receiveCurrentUser = user => ({
    type: RECEIVE_CURRENT_USER,
    user,       // user as payload
});

const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER,
});

// thunk action
// user object form before
// from thunk middleware
// postUser (AJAX request imported from above)
// which returns a promise, we can call .then
// return to us a user, dispatch action creater, but invoking it
export const createNewUser = formUser => dispatch => postUser(formUser)
    .then(user => dispatch(receiveCurrentUser(user)));


export const login = formUser => dispatch => postSession(formUser)
    .then(user => dispatch(receiveCurrentUser(user)));

export const logout = () => dispatch => deleteSession()
    .then(() => dispatch(logoutCurrentUser()));