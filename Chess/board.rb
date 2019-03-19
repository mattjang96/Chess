require_relative "bishop"
require_relative "king"
require_relative "queen"
require_relative "rook"
require_relative "pawn"
require_relative "knight"
require_relative "nullpiece"
require_relative "piece"

class Board
    BACK_PIECES = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]

    def initialize()
        @rows = Array.new(8) {Array.new(8, nil)}
        populate_back_row
        populate_pawns
        populate_null
    end

    def move_piece(start_pos, end_pos)  

    end 

    private

    def populate_back_row
        back_rows = [[0, :white], [7, :black]]
        back_rows.each do |subarr|
            idx = subarr[0] 
            color = subarr[1]
            BACK_PIECES.each_with_index do |piece, j|
                @rows[idx][j] = piece.new(color, self, [idx,j])
            end
        end
    end

    def populate_pawns
        pawn_rows = [[1, :white], [6, :black]]
        pawn_rows.each do |subarr|
            idx = subarr[0]
            color = subarr[1]
            @rows[idx].each_with_index { |el, j| @rows[idx][j] = Pawn.new(color, self, [idx, j])}
        end 
    end 

    def populate_null 
        (2..5).each do |i|
            @rows[i].each_with_index {|el, j| @rows[i][j] = NullPiece.instance}
        end 
    end 
    
end

test = Board.new()