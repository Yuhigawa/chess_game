defmodule BaordTest do
  use ExUnit.Case
  alias Chess.Player
  alias Chess.Board
  alias Chess.Piece

  describe "Board struct" do
    test "initializes a board with 8 rows" do
      player_black = Player.new("Player 1", :black)
      player_white = Player.new("Player 2", :white)
      board = Board.new(player_black, player_white).board

      assert length(board) == 8
    end

    test "initializes a board with 8 rows with 8 cells" do
      player_black = Player.new("Player 1", :black)
      player_white = Player.new("Player 2", :white)
      board = Board.new(player_black, player_white).board

      row = Enum.at(board, 0).row
      assert length(row) == 8
    end

    test "initializes a board with 8 rows with 8 cells and assert rook piece of black" do
      player_black = Player.new("Player 1", :black)
      player_white = Player.new("Player 2", :white)
      board = Board.new(player_black, player_white).board

      rook_piece = %Piece{
        piece: %{
          type: :rook,
          x_position: 1,
          y_position: 8,
          moviment: "C",
          moviment_length: 8
        }
      }

      row = Enum.at(board, 0).row
      cell = Enum.at(row, 0).cell

      assert cell.x_position == 1
      assert cell.y_position == 8
      assert cell.piece == rook_piece
      assert cell.player == %{name: "Player 1", side: :black}
    end

    test "initializes a board with 8 rows with 8 cells and assert rook piece of white" do
      player_black = Player.new("Player 1", :black)
      player_white = Player.new("Player 2", :white)
      board = Board.new(player_black, player_white).board

      rook_piece = %Piece{
        piece: %{
          type: :rook,
          x_position: 8,
          y_position: 1,
          moviment: "C",
          moviment_length: 8
        }
      }

      row = Enum.at(board, 7).row
      cell = Enum.at(row, 7).cell

      assert cell.x_position == 8
      assert cell.y_position == 1
      assert cell.piece == rook_piece
      assert cell.player == %{name: "Player 2", side: :white}
    end
  end
end
