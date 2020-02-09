import { connect } from 'react-redux';
import { createNewUser } from '../../actions/session';
import Signup from './signup';

// no need to rely on any state
// pass down action to it
const mapDispatchToProps = dispatch => ({
    createNewUser: formUser => dispatch(createNewUser(formUser)),
});

export default connect(null, mapDispatchToProps)(Signup);