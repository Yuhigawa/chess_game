defmodule RowTest do
  use ExUnit.Case
  alias Chess.Row
  alias Chess.Player

  describe "Row struct" do
    test "initializes a row with 8 cells" do
      row = Row.new(1, [], nil)
      assert length(row.row) == 8
    end

    test "initializes a row with a cell" do
      row = Row.new(1, [], nil)
      cell = hd(row.row)

      assert cell.cell.x_position == 1
      assert cell.cell.y_position == 1
      assert cell.cell.piece == nil
      assert cell.cell.player == nil
    end

    test "initializes a row with a cell and nil piece on position" do
      row = Row.new(1, [], nil).row
      cell = Enum.at(row, 1).cell

      assert cell.x_position == 2
      assert cell.y_position == 1
      assert cell.piece == nil
      assert cell.player == nil
    end

    test "initializes a row with a cell with a piece for the black side" do
      player = Player.new("Player 1", :black)
      pieces = Chess.Player.get_pieces(player) |> Enum.filter(fn piece -> piece.piece.y_position == 8 end)

      row = Row.new(8, pieces, player)
      cell = Enum.at(row.row, 0).cell

      assert cell.x_position == 1
      assert cell.y_position == 8
      assert cell.piece == hd(pieces)
      assert cell.player == %{name: "Player 1", side: :black}
    end

    test "initializes a row with a cell with a piece for the white side" do
      player = Player.new("Player 2", :white)
      pieces = Chess.Player.get_pieces(player) |> Enum.filter(fn piece -> piece.piece.y_position == 1 end)

      row = Row.new(1, pieces, player)
      cell = Enum.at(row.row, 0).cell

      assert cell.x_position == 1
      assert cell.y_position == 1
      assert cell.piece == hd(pieces)
      assert cell.player == %{name: "Player 2", side: :white}
    end
  end
end
