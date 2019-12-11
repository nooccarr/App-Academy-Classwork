require_relative "../piece.rb"
require_relative "slideable"

class Rook < Piece
    include Slideable

    def symbol
        :R
    end

    def moves_dirs
        horizontal_and_vertical_dirs
    end
end