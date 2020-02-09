import React from 'react';
import Greeting from './session/greeting_container';

const App = () => {
  // debugger
  return (
    <div>
      <header>
        <h1>Bench BnB</h1>
        <Greeting />
      </header>

      <Route path="/login" component={LoginFormContainer} />
      <Route path="/signup" component={SignupFormContainer} />
    </div>
  )
}

export default App;

