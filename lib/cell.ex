defmodule Chess.Cell do
  @moduledoc "Represents a single cell on the chessboard."
  @enforce_keys [:cell]
  @derive Jason.Encoder
  defstruct cell: %{
    x_position: nil,
    y_position: nil,
    piece: nil,
    player: nil
  }
end
