const View = require('./ttt-view.js');
const Game = require('../../solution/game.js');
  $(() => {
    const game = new Game();
    const $ttt = $(".ttt");
    new View(game,$ttt);

    $el.on("click", ".square", event => {
      const currentTarget = event.target;
      const $currentTarget = $(currentTarget);
      const pos = $currentTarget.attr("data-pos");
      this.game.playMove(pos);
    }
    );



  });

