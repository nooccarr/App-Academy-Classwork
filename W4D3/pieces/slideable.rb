module Slideable
    HORIZONTAL_AND_VERTICAL_DIRS = [
        [1, 0],
        [-1, 0],
        [0, 1],
        [0, -1]
    ]
    
    DIAGONAL_DIRS = [
        [1,1],
        [1,-1],
        [-1,1],
        [-1,-1]
    ]

    def horizontal_and_vertical_dirs
        HORIZONTAL_AND_VERTICAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        moves = []
        moves_dirs.each do |dx,dy|
            moves << grow_unblocked_moves_in_dir(dx,dy)
        end

        moves
    end
    
    def moves_dirs
    end

    def grow_unblocked_moves_in_dir(dx,dy)
        x,y = pos
        moves = []
        pos = [(x + dx), (y + dy)]
        if board.valid_pos?(pos)
            if board.empty?(pos)
                moves << pos
            else
                moves << pos if board[pos].color != color
            end     
        end
        moves
    end

end


