require "colorize"
require_relative "board"
require_relative "cursor"

class Display 
    attr_accessor :board, :cursor

    def initialize(board)
        @cursor = Cursor.new([0,0], board)
        @board = board.rows
        render
    end

    def render
        @board.each_with_index do |row, i|
            row.each_with_index do |square, j|
                if @cursor.cursor_pos == [i,j]
                    print square.symbol.colorize(:green).colorize(:background => :red)
                elsif (i.even? && j.even?) || (i.odd? && j.odd?)
                    print square.symbol.colorize(:white).colorize(:background => :black)
                else 
                    print square.symbol.colorize(:black).colorize(:background => :white)
                end 
            end 
            puts 
        end 
        @cursor.get_input
    end

end 

test = Board.new()
look = Display.new(test)
pawn = test[[1,1]]
p knight.moves
test[[2,2]] = Pawn.new(:white, test, [2,2])
p knight.moves


# # to test cursor
# a = false 
# while a != true
#     look.render
#     # look.cursor.get_input
#     p look.cursor.cursor_pos
# end 
