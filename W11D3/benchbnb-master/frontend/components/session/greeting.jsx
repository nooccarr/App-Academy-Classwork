import React from 'react';
import { Link } from 'react-router-dom';


const Greeting = (props) => {

  if (props.currentUser) {
    return (
      <div>
        <h2>
          Welcome, {props.currentUser.username}
        </h2>
        <button onClick={props.logout}>Log out</button>
      </div>
    )
  } else {
    return (
      <div>
        <Link to="/signup" />
        <Link to="/login" />
      </div>
    )
  }
};

export default Greeting;