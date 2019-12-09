require_relative 'tic_tac_toe_node'
require "byebug"
class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    moves = TicTacToeNode.new(game.board, mark).children
    winning_moves = moves.select{|move| move.winning_node?(mark)}
    # debugger
    return winning_moves.sample.prev_move_pos unless winning_moves.empty?
    non_losing_moves = moves.select{|move| !move.losing_node?(mark)}
    # debugger
    return non_losing_moves.sample.prev_move_pos
    raise "Error. Only Losing Moves"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
