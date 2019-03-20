require_relative "piece"
# require_relative "display" 

class Board
    BACK_PIECES = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]

    attr_accessor :rows

    def initialize()
        @rows = Array.new(8) {Array.new(8, nil)}
        populate_back_row
        populate_pawns
        populate_null
    end

    def [](pos)
        x, y = pos
        @rows[x][y] 
    end

    def []=(pos, piece)
        x, y = pos
        @rows[x][y] = piece
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end

    def find_king(color)
        var = []
        @rows.each_with_index do |subarr, i|
            @rows.each_with_index do |piece, j|
                var[0], var[1] = i, j if piece.class == King && piece.color == color
            end
        end
        var
    end

    

    def move_piece(start_pos, end_pos)  
        # Display.render
    end 

    def valid_pos?(pos)
        (0..7).include?(pos[0]) && (0..7).include?(pos[1])
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
p test.rows