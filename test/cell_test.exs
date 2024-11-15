defmodule CellTest do
  use ExUnit.Case
  alias Chess.Cell

  describe "Cell struct" do
    test "default values" do
      cell = %Cell{cell: %{x_position: nil, y_position: nil, piece: nil, player: nil}}

      assert cell.cell.x_position == nil
      assert cell.cell.y_position == nil
      assert cell.cell.piece == nil
      assert cell.cell.player == nil
    end

    test "creating a cell with values" do
      cell = %Cell{cell: %{x_position: 1, y_position: 2, piece: :pawn, player: :white}}

      assert cell.cell.x_position == 1
      assert cell.cell.y_position == 2
      assert cell.cell.piece == :pawn
      assert cell.cell.player == :white
    end
  end
end
