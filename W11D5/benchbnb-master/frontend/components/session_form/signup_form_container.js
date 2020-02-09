import { connect } from "react-redux";
import SessionForm from './session_form';

const mSTP = (state, ownProps) => {
    debugger
    return {
        errors: state.entities.errors,
        formType: 'signup'
    };
};

const mDTP = (dispatch, ownProps) => {
    return {
        const processForm = () => {
            
        }
    };
};




export default connect(mSTP, mDTP)(SessionForm);





