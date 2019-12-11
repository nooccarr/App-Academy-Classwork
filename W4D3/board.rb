require_relative "pieces"

class Board
    attr_accessor :board
    def initialize
        @sentinel = NullPiece.instance
        @board = Array.new(8) {Array.new(8, @sentinel)}
    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @board[row][col] = val
    end

    def populate
        @board.each_with_index do |row, r|
            row.each_with_index do |col, c|
                @board[r][c] = Pawn.new("blue", @board, [r, c]) if r == 1 
                @board[r][c] = Pawn.new("red", @board, [r, c]) if r == 6 

            end
        end
        @board[0][0] = Rook.new("blue", @board, [0, 0])
        @board[0][7] = Rook.new("blue", @board, [0, 7])
        @board[7][0] = Rook.new("red", @board, [7, 0])
        @board[7][7] = Rook.new("red", @board, [7, 7])
        @board[0][1] = Knight.new("blue", @board, [0, 1])
        @board[0][6] = Knight.new("blue", @board, [0, 6])
        @board[7][1] = Knight.new("red", @board, [7, 1])
        @board[7][6] = Knight.new("red", @board, [7, 6])
        @board[0][2] = Bishop.new("blue", @board, [0, 2])
        @board[0][5] = Bishop.new("blue", @board, [0, 5])
        @board[7][2] = Bishop.new("red", @board, [7, 2])
        @board[7][5] = Bishop.new("red", @board, [7, 5])
        @board[0][3] = Queen.new("blue", @board, [0, 3])
        @board[7][3] = Queen.new("red", @board, [7, 3])
        @board[0][4] = King.new("blue", @board, [0, 4])
        @board[7][4] = King.new("red", @board, [7, 4])
    end

    def move_piece(start_pos, end_pos)
        piece = self[star_pos]
        
    end

    def valid_pos?(pos)
        pos.all? { |num| num.between?(0,7)}
    end

    def add_piece(piece,pos)
        self[pos] = piece if empty?(pos)
    end

    def checkmate?(color)
    end

    def in_check?(color)
    end

    def find_king(color)
    end

    def pieces
    end

    def dup
    end

    def move_piece!(color, start_pos, end_pos)
        raise "This is an invalid Start Position" if start_pos.is_a?(NullPiece)

        piece = self[start_pos]
        if piece.color != color
            raise "This is not your color"
        elsif !piece.moves.include?(self[end_pos])
            raise "You can't move here"
        end

        piece = end_pos

    end
end

p b = Board.new
p b.populate
# p b.board[3,5]