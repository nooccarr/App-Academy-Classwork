module Stepable

    def moves
        moves = []
        move_diffs.each do |dx,dy|
            x,y = pos
            pos = [(dx+x),(dy+y)]
            if board.valid_pos?(pos)
                if board.empty?(pos)
                    moves << pos
                else
                    moves << pos if board[pos].color != color
                end
            end     
        end
        moves
    end

    def move_diffs
    end
end