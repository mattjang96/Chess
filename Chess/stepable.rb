module Stepable

    KING = [[-1,1], [-1,0], [-1,1], [0,-1], [0,1], [1,-1], [1,0], [1,1]]
    KNIGHT = [[1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1], [-1,2], [-2,1]]

    def king_dirs
        KING
    end

    def knight_dirs
        KNIGHT
    end

    def moves
        possible = []
        move_dirs.each do |dir|
            x = @pos[0] + dir[0]
            y = @pos[1] + dir[1]
            possible << [x,y]
        end 
        possible.select! {|ele| ( (0..7).include?(ele[0]) ) && ( (0..7).include?(ele[1]) )}
        possible.select! {|ele| !something_there?(ele) }
    end 

    private
    def something_there?(pos)
        if @board[pos].class == NullPiece # empty space
            return false
        elsif @board[pos].color != self.color
            return false
        else 
            return true
        end 
    end

end