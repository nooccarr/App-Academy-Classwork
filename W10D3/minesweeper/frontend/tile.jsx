import React from "react";

class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
    // this.state = {
    //   bombed: this.props.tile.bombed,
    //   explored: this.props.tile.explored,
    //   flagged: this.props.tile.flagged
    // };
  }

  handleClick(e) {
    const flagged = e.altKey ? true : false;
    this.props.updateGame(this.props.tile, flagged);
  }


  render() {
    const tile = this.props.tile;
    let name = "";
    let text = "";
    let count = "";
    if (tile.explored) {
      if (tile.bombed) {
        name = 'bombed';
        text = '\u2622';
      } else {
        name = 'explored';
        count = tile.adjacentBombCount();
        text = (count > 0 ? `${count} ` : "");
      }
    } else if (tile.flagged) {
      name = 'flagged';
      text = '\u2691';
    } else {
      name = 'unexplored';
    }
    name = `tile ${name}`;

    return (
      <div className={name} onClick={this.handleClick}>{text}</div>
    );
  }
}

export default Tile;