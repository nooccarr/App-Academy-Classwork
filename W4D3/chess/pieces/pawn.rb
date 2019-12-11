require_relative "../piece.rb"
require_relative "stepable"

class Pawn < Piece
    include Stepable
    def symbol
        :P
    end

    def moves
        forward_steps + side_attacks
    end

    def at_start_row?
        pos[0] == 1 || pos[0] == 6
    end

    def forward_dir
        if color == blue
            return 1
        else
            return -1
        end
    end

    def forward_steps

    end

    def side_attacks
    end
    
end 