require_relative "../piece.rb"
require_relative "slideable"
class Bishop < Piece
    include Slideable

    def symbol
        :B
    end

    def moves_dirs
        diagnal_dirs
    end
end