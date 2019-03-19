require_relative "piece"

class Queen < Piece

    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? "\u2655" : "\u265B"
    end 

end 