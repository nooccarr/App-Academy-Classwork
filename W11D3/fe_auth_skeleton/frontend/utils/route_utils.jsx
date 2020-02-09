import React from 'react';
import { connect } from 'react-redux';
import { Redirect, Route, withRouter } from 'react-router-dom';

const mSTP = state => ({
    loggedIn: Boolean(state.session.currentUser)
});

// <AuthRoute path="" component={} />
// build auth component
const Auth = ({ loggedIn, path, component: Component }) => (
    <Route
        path={path}
        render={props => (          // else, spread props and pass it into Component
            loggedIn ? <Redirect to="/" /> : <Component {...props} />
        )}
    />
);

// destructure component & assign to Component
const Protected = ({ loggedIn, path, component: Component }) => (
    <Route
        path={path}
        render={props => (
            loggedIn ? <Component {...props} /> : <Redirect to="/signup" />
        )}
    />
);

export const AuthRoute = withRouter(connect(mSTP)(Auth));
export const ProtectedRoute = withRouter(connect(mSTP)(Protected));