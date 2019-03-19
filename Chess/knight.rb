require_relative "piece"

class Knight < Piece

    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? "\u2658" : "\u265E"
    end 

end 

