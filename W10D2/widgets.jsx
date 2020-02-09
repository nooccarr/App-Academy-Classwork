import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';

const tabs = [
  {title: 'First title', context: 'This is the first title'},
  { title: 'Second title', context: 'This is the second title' },
  { title: 'Third title', context: 'This is the third title' }
];

function Root () {
  return( 
    <div>
      <Clock/>
      <Tab tabs={"tabs"}/>
    </div>
  );

}
document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById("main");
  ReactDOM.render(<Root/>, main);

});