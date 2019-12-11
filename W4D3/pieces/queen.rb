require_relative "../piece.rb"
require_relative "slideable"

class Queen < Piece
    include Slideable

    def symbol
        :Q
    end

    def moves_dirs
        horizontal_and_vertical_dirs + diagnal_dirs
    end
end