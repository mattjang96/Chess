require "singleton"
require_relative "slideable"
require_relative "stepable"
require_relative "board"

class Piece
    attr_accessor :color, :board, :pos

    def initialize(color, board, pos)
        @color, @board, @pos = color, board, pos
    end

    def to_s # puts
        "#{symbol}"
    end

    def empty?

    end

    def valid_moves

    end

end

class Bishop < Piece
    include Slideable
    attr_accessor :symbol
    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? " \u2657 " : " \u265D "
    end 

    def move_dirs
        diagonal_dirs
    end
end 

class King < Piece
    include Stepable
    attr_accessor :symbol
    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? " \u2654 " : " \u265A "
    end 

    def move_dirs
        king_dirs
    end

end 

class Knight < Piece
    include Stepable
    attr_accessor :symbol
    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? " \u2658 " : " \u265E "
    end 

    def move_dirs
        knight_dirs
    end

end 

class Pawn < Piece
    attr_accessor :symbol
    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? " \u2659 " : " \u265F "
    end 

end 

class Queen < Piece
    include Slideable
    attr_accessor :symbol
    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? " \u2655 " : " \u265B "
    end 

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end

end 

class Rook < Piece
    include Slideable
    attr_accessor :symbol
    
    def initialize(color, board, pos)
        super 
        @symbol = (@color == :white) ? " \u2656 " : " \u265C "
    end 

    def move_dirs
        horizontal_dirs 
    end

end 

class NullPiece < Piece
    include Singleton
    attr_accessor :symbol
    def initialize
        @symbol = "   "
    end

end