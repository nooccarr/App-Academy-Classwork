import React from "react";
import Tile from "./tile";

class Board extends React.Component {
  constructor (props) {
    super(props);

    this.createRows = this.createRows.bind(this);
    this.createTiles = this.createTiles.bind(this);
  }

  createRows () {
    const board = this.props.board.grid.map((row, idx) => {
      return (<div className="row" key={`row-${idx}`}>{this.createTiles(row, idx)}</div>)
    }); 
    // debugger
    return board;

  }

  createTiles (row, idx) {
    return row.map ((tile, i) => {
      return (
        <div className={`tile-${idx}-${i}`} key={`tile-${idx}-${i}`}>
        <Tile 
            key={`tile-${idx}-${i}`} 
            tile={tile}
            updateGame={this.props.updateGame}
        />
        </div>
      )
      })
  }
  render () {
    return (
      <div className="board">
        {this.createRows()}
      </div>
  )}
}

export default Board;