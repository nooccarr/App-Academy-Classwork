require_relative "../piece.rb"
require_relative "stepable"

class Knight < Piece
    include Stepable

    def symbol
        :KH
    end

    def moves_dirs
        [ 
        [-2, -1],
        [-2,  1],
        [-1, -2],
        [-1,  2],
        [ 1, -2],
        [ 1,  2],
        [ 2, -1],
        [ 2,  1]
        ]
    end
end