require_relative "piece"

class Bishop < Piece

    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? "\u2657" : "\u265D"
    end 

end 