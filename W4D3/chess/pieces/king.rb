require_relative "../piece.rb"
require_relative "stepable"

class King < Piece
    include Stepable

    def symbol
        :K
    end

    def moves_dirs
        [
        [1, 0],
        [-1, 0],
        [0, 1],
        [0, -1],
        [1, 1],
        [1, -1],
        [-1, 1],
        [-1, -1]
        ]
    end
   
end