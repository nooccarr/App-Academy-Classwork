require_relative "../piece.rb"
require "singleton"

class NullPiece < Piece
    include Singleton
    attr_reader :symbol

    def initialize
    end

    def moves
        []
    end

    def symbol
        :__
    end
end