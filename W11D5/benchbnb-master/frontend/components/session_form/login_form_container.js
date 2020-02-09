import { connect } from "react-redux";
import React from 'react';
import SessionForm from './session_form';
import { Link } from 'react-router-dom';
import { login } from '../../actions/session_actions';

const mSTP = ({ errors }) => {
    return {
        errors: errors.session,
        formType: 'login',
        nevLink: <Link to="/signup">sign up instead</Link>
    };
};

const mDTP = (dispatch) => {
    return {
        processForm: (user) => dispatch(login(user)),
    };
};

export default connect(mSTP, mDTP)(SessionForm);
