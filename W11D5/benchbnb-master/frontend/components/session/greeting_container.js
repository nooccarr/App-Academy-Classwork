import { connect } from 'react-redux';
import Greeting from './greeting';
import { logout } from '../../actions/session_actions';

const mSTP = (state) => {
  return {  // set state.currentUser as props (key, val pair)
    currentUser: state.entities.users[state.session.id]
  };  // state.session.id -> current user id
};    // use current user id to get info from(key into) state.entities.users

const mDTP = (dispatch) => {
  return {
    logout: () => dispatch(logout())
  };  // logout action to the creator
};

export default connect(mSTP, mDTP)(Greeting);