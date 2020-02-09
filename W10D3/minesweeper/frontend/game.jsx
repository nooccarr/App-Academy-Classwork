import React from 'react';
import * as GameLogic from '../minesweeper.js';
import Board from './board';

class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      board: new GameLogic.Board(9, 10)
    };
 
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(tile, flagged) {
    if (flagged) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }

    this.setState({ board: this.state.board });
  }

  endGame () {
    
  }
  // this.updateGame
  render() {
    return (
      <div>
        <Board board={this.state.board} updateGame={this.updateGame}/>
      </div>
    )
  }
}



export default Game;