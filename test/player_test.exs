defmodule PlayerTest do
  use ExUnit.Case
  alias Chess.Player

  describe "Player struct" do
    test "initializes a player with a name and side black" do
      player = Player.new("Player 1", :black).player
      assert player[:name] == "Player 1"
      assert player[:side] == :black
    end

    test "initializes a player with a name and side white" do
      player = Player.new("Player 2", :white).player
      assert player.name == "Player 2"
      assert player.side == :white
    end

    test "initializes a player on black side with rook piece" do
      player = Player.new("Player 1", :black)
      pieces = Player.get_pieces(player)

      rook_piece = Enum.find(pieces, fn piece ->
        piece.piece[:x_position] == 1 &&
        piece.piece[:y_position] == 8 &&
        piece.piece[:type] == :rook
      end)

      assert player.player.name == "Player 1"
      assert player.player.side == :black

      assert length(pieces) == 16

      assert rook_piece.piece[:type] == :rook
      assert rook_piece.piece[:moviment] == "C"
      assert rook_piece.piece[:moviment_length] == 8
      assert rook_piece.piece[:x_position] == 1
      assert rook_piece.piece[:y_position] == 8
    end

    test "initializes a player on white side with rook piece" do
      player = Player.new("Player 2", :white)
      pieces = Player.get_pieces(player)

      rook_piece = Enum.find(pieces, fn piece ->
        piece.piece[:x_position] == 1 &&
        piece.piece[:y_position] == 1 &&
        piece.piece[:type] == :rook
      end)

      assert player.player.name == "Player 2"
      assert player.player.side == :white

      assert length(pieces) == 16

      assert rook_piece.piece[:type] == :rook
      assert rook_piece.piece[:moviment] == "C"
      assert rook_piece.piece[:moviment_length] == 8
      assert rook_piece.piece[:x_position] == 1
      assert rook_piece.piece[:y_position] == 1
    end
  end
end
