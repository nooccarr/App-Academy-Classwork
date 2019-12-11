class Piece

    attr_reader :board, :color
    attr_accessor :pos

    def initialize(color, board, pos)
        @color = color          # symbol
        @board = board          # Board
        @pos = pos              # Array
        board.add_piece(self, pos)
    end

    def to_s
        symbol.to_s
    end

    def empty?
        false
    end

    def valid_moves
    end

    def pos=(val)
    end

    def symbol

    end

    def move_into_check?(end_pos)

    end
end