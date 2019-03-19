module Stepable

    KING = [[-1,1], [-1,0], [-1,1], [0,-1], [0,1], [1,-1], [1,0], [1,1]]
    KNIGHT = [[1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1], [-1,2], [-2,1]]

    def king_dirs
        KING
    end

    def knight_dirs
        KNIGHT
    end

    def moves(start)
        possible = []
        move_dirs.each do |dir|
            x = start[0] + dir[0]
            y = start[1] + dir[1]
            possible << [x,y]
        end 
        possible
    end 

end