import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date()
    };
    this.tick = this.tick.bind(this);
  }
  
  componentDidMount() {
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.intervalId);
  }

  tick() {
    this.setState({ time: new Date() });
  }

  render() {
    let hours = this.state.time.getHours();
    let minutes = this.state.time.getMinutes();
    let seconds = this.state.time.getSeconds();
    let date = this.state.time.toDateString();

    return (
      <div>
        {/* <h1>{hours}:{minutes}:{seconds}</h1>   */}
        <h1>Clock</h1>
        <div className="clock">
          <ul>
            <li>
              <h2>Time: </h2>
              <h2>{hours}:{minutes}:{seconds} EST</h2>
            </li>
            <li>
              <h2>Date: </h2>
              <h2>{date}</h2>
            </li>
          </ul>
        </div>
      </div>
      
    );
  }




}



// const clock = new Clock();
export default Clock;