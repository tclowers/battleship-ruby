# battleship_test.rb

require 'minitest/autorun'
require_relative 'battleship'

class BattleshipTest < Minitest::Test
    def setup
        @battleship = Battleship.new
    end

    def test_has_to_string
        assert defined? @battleship.to_string
    end

    def test_to_string_outputs_string
        assert @battleship.to_string.is_a? String
    end

    def test_board_has_10_lines
        board = @battleship.to_string
        assert_equal 10, board.count("\n")
    end

    def test_has_vertical
        assert defined? @battleship.vertical?
    end

    def test_vertical_returns_bool
        is_vertical = @battleship.vertical?
        assert !!is_vertical == is_vertical
    end

    def test_has_get_space
        assert defined? @battleship.get_space
    end

    def test_get_space_returns_int
        assert @battleship.get_space.is_a? Integer
    end

    def test_set_piece
        piece = Hash["symbol" => "S", "size" => 3]
        @battleship.set_piece(piece)
        board = @battleship.to_string
        assert board.count(piece["symbol"]) == piece["size"]
    end

    def test_has_setup_board
        assert defined? @battleship.setup_board
    end

    def test_setup_board_has_all_pieces
        pieces = [
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

        @battleship.setup_board
        board = @battleship.to_string

        pieces.each do |piece|
            assert_equal piece["size"], board.count(piece["symbol"])
        end
    end
end