require_relative "piece"

class King < Piece

    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? "\u2654" : "\u265A"
    end 

end 