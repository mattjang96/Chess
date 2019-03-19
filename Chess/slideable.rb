module Slideable

    HORIZONTAL_DIRS = [[-1,0], [0,-1], [0,1], [1,0]]
    DIAGONAL_DIRS = [[-1,-1], [-1,1], [1,-1], [1,1]]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end 

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves(start)
        possible = []
        move_dirs.each do |dir|
            possible += grow_moves(start, dir)
        end 
        possible 
    end 

    private
    def grow_moves(start, diff)
        results = []
        x, y = start[0], start[1]
        until !(0..7).include?(x) || !(0..7).include?(y)
            x, y = x + diff[0], y + diff[1]
            result << [x,y]
        end 
        result 
    end

end