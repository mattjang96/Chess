require "singleton"

class Piece
    attr_accessor :color, :board, :pos

    def initialize(color, board, pos)
        @color, @board, @pos = color, board, pos
    end

    def to_s # puts
 
    end

    def empty?

    end

    def valid_moves

    end

end

class Bishop < Piece

    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? "\u2657" : "\u265D"
    end 

end 

class King < Piece

    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? "\u2654" : "\u265A"
    end 

end 

class Knight < Piece

    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? "\u2658" : "\u265E"
    end 

end 

class Pawn < Piece
    
    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? "\u2659" : "\u265F"
    end 

end 

class Queen < Piece

    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? "\u2655" : "\u265B"
    end 

end 

class Rook < Piece

    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? "\u2656" : "\u265C"
    end 

end 

class NullPiece < Piece
    include Singleton

    def initialize
    end

end