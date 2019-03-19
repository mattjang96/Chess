require_relative "piece"

class Pawn < Piece
    
    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? "\u2659" : "\u265F"
    end 

end 