# battleship.rb

class Battleship
    attr_accessor :board
    attr_accessor :board_size
    attr_accessor :empty_space
    attr_accessor :pieces

    def initialize
        # 10 spaces to a side - 1 for indexes starting at 0
        @board_size = 10 - 1

        @empty_space = ". "

        @line = []
        (0..@board_size).each do |i|
            @line.push(@empty_space)
        end

        @board = []
        (0..@board_size).each do |i|
            @board.push(@line.clone)
        end

        @pieces = [
            Hash[
                "symbol" => "T",
                "size" => 2
            ],
            Hash[
                "symbol" => "D",
                "size" => 3
            ],
            Hash[
                "symbol" => "S",
                "size" => 3
            ],
            Hash[
                "symbol" => "B",
                "size" => 4
            ],
            Hash[
                "symbol" => "C",
                "size" => 5
            ]
        ];
    end

    def check_spaces size, column, row, is_vertical
        result = true
        (0..size).each do
            if (self.board[row][column] != self.empty_space)
                result = false
            end

            if (is_vertical)
                row += 1
            else
                column += 1
            end
        end
        result
    end

    def get_space size=0
        space_limit = size > 0 ? self.board_size - size : self.board_size
        rand(0..space_limit)
    end

    def setup_board
        self.pieces.each do |piece|
            self.set_piece(piece)
        end
    end

    def set_piece piece
        space_available = false
        is_vertical = self.vertical?
        until space_available do
            row = is_vertical ? self.get_space(piece["size"]) : self.get_space
            column = is_vertical ? self.get_space : self.get_space(piece["size"])
            space_available = self.check_spaces(piece["size"], column, row, is_vertical)
        end

        (1..piece["size"]).each do
            self.board[row][column] = piece["symbol"] + " "
            if (is_vertical)
                row += 1
            else
                column += 1
            end
        end
    end

    def to_string
        output = ''
        self.board.each do |line|
            line.each do |space|
                output << space
            end
            output << "\n"
        end
        output
    end

    def vertical?
        [true, false].sample
    end
end

# Example Usage
battleship = Battleship.new
battleship.setup_board
puts battleship.to_string