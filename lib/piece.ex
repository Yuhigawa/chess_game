defmodule Chess.Piece do
  @moduledoc "Represents a piece with it's details."
  @enforce_keys [:piece]
  @derive Jason.Encoder
  defstruct piece: %{
    type: nil,
    player: nil,
    moviment: nil,
    moviment_length: nil
  }
end
