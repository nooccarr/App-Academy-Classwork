let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  const grid = [];

  for (let i = 0; i < 8; i++) {
    let row = new Array(8);
    grid.push(row);
  }
  
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");

  return grid;
}

// white = X
// black = O
// [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ]
// [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ]
// [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ] 
// [ ] [ ] [ ] [x] [o] [ ] [ ] [ ] 
// [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ]
// [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ]
// [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ]
// [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ]

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {

  if (!this.isValidPos(pos)) {
    throw new Error("Not valid pos!");
  }

  return this.grid[pos[0]][pos[1]]; // returns black/white piece
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {

};


/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  return this.getPiece(pos) && (this.getPiece(pos).color) === color;
};      // ending position

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return this.getPiece(pos);
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  return (pos[0] >= 0 && pos[0] < 8) && (pos[1] >= 0 && pos[1] < 8); 
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.       // scans the whole board
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */          // intance / starting / current player / [1,0]  for us
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {
  if (!piecesToFlip) {        // first iteration
    piecesToFlip = [];
  } else {
    piecesToFlip.push(pos);   // after first iteration
  }

  let pos2 = [pos[0] + dir[0], pos[1] + dir[1]];
  
  if (!board.isValidPos(pos2)) {
    return null;
  } else if (!board.isOccupied(pos2)) {
    return null;
  } else if (board.isMine(pos2, color)) {
    return piecesToFlip.length === 0 ? null : piecesToFlip;
  } else {
    return _positionsToFlip(board,pos2, color, dir, piecesToFlip);
  }
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {

  for (let i = 0; i < 8; i++) {
    let string = i + "|";

    for (let j = 0; j < 8; j++) {
      let pos = [i, j];
      if (this.getPiece(pos)) {
        string += this.getPiece(pos);
      } else {
          string += "-";
      } 
    }
    
    console.log(string);
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */     // checks if the move is valid
Board.prototype.validMove = function (pos, color) { // valid
  if (this.isOccupied(pos)) {
    return false;
  }

  for (let i = 0; i < Board.DIRS.length; i++) {   // iterate through possible dirs

    const positions = _positionsToFlip(this, pos, color, Board.DIRS[i]);
    if (position) {
      return true;              // if attaking is possible
    }
  }
  

  return false;
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {   // possible moves

  const listOfmoves = [];

  for (let i = 0; i < 8; i++) {
    for (let j = 0; j < 8; j++) {
      if (this.validMove([i,j], color)) {
        listOfmoves.push([i,j]);
      }
    }
  }

  return listOfmoves;

};

module.exports = Board;
