class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  // bindEvents() {
  //   // this.$el.on("click", ".square", event => {
  //   //   const currentTarget = event.currentTarget;
  //   //   const $currentTarget = $(currentTarget);
  //   //   this.makeMove($currentTarget);
  //   // }
  //   // );
  //   this.$el.on("click", "li", (event => {
  //     const $square = $(event.currentTarget);
  //     this.makeMove($square);
  //   }));
    
  // }
  bindEvents() {
    // install a handler on the `li` elements inside the board.
    this.$el.on("click", "li", (event => {
      const $square = $(event.currentTarget);
      this.makeMove($square);
    }));
  }
  makeMove($square) {
    const pos = $square.data("data-pos");
    const currentPlayer = this.game.currentPlayer;

    try {
      this.game.playMove(pos);
    } catch (e) {
      alert("This " + e.msg.toLowerCase());
      return;
    }

    $square.addClass(currentPlayer);

    if (this.game.isOver()) {
      // cleanup click handlers.
      this.$el.off("click");
      this.$el.addClass("game-over");

      const winner = this.game.winner();
      const $figcaption = $("<figcaption>");

      if (winner) {
        this.$el.addClass(`winner-${winner}`);
        $figcaption.html(`You win, ${winner}!`);
      } else {
        $figcaption.html("It's a draw!");
      }

      this.$el.append($figcaption);
    }
  }


 

  setupBoard() {
    for(let rowIdx = 0; rowIdx < 3; rowIdx++){
      const $ul = $("<ul>").addClass("group");
      for (let colIdx = 0; colIdx < 3; colIdx++) {
        const $li = $("<li>").data("data-pos", [rowIdx, colIdx]);
        $ul.append($li);
      }
    this.$el.append($ul);
    }
  }

  
}

module.exports = View;
