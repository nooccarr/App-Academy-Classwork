require_relative 'tic_tac_toe'
require "byebug"
class TicTacToeNode
  def inspect
    @prev_move_pos.inspect
  end
  attr_reader :board, :next_mover_mark, :prev_move_pos, :this_mark
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @new_mark = (@next_mover_mark == :x ? :o : :x)
  end

  def losing_node?(evaluator)
    # certain_winner = @board.winner
    # return (certain_winner != evaluator) ? true : false unless certain_winner == nil
    if board.over?
      return board.won? && board.winner != evaluator
    end
    # other_eval = (evaluator == :x ? :o : :x)
    # self.children.each do |child|
    #   return true if child.losing_node?(evaluator)
    # end
    # false
    if evaluator == @next_mover_mark
      return self.children.all?{|child| child.losing_node?(evaluator)}
    else
      return self.children.any?{|child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    # certain_winner = @board.winner
    # return (certain_winner == evaluator) ? true : false unless certain_winner == nil
    if board.over?
      return board.winner == evaluator
    end
    # other_eval = (evaluator == :x ? :o : :x)
    # self.children.each do |child|
    #   return child.winning_node?(evaluator)
    # end
    # false
    if evaluator == @next_mover_mark
      return self.children.any? {|child| child.winning_node?(evaluator)}
    else
      return self.children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    new_arr = []
    (0..2).each do |i|
      (0..2).each do |j|
        pos = [i,j]
        if @board.empty?(pos)
          new_board = @board.dup
          new_board[pos] = @next_mover_mark
          new_node = TicTacToeNode.new(new_board, @new_mark, pos)
          new_arr << new_node
        end
      end
    end
    new_arr
  end
end

