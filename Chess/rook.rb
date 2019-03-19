require_relative "piece"

class Rook < Piece

    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? "\u2656" : "\u265C"
    end 

end 