defmodule Chess.Row do
  @moduledoc """
  Represents a row of cells on the chessboard.

  Each row contains 8 cells. Each cell may contain:
  - A player's piece, if applicable.
  - A reference to the owning player, if applicable.
  """

  @enforce_keys [:row]
  @derive Jason.Encoder
  defstruct row: []

  alias Chess.Cell
  alias Chess.Player

  @doc """
  Initializes a row with 8 cells, each cell having the specified `y_position`.
  If no pieces or player are provided, the row is initialized without pieces or player references.
  """
  def new(y_position, pieces \\ [], player \\ nil) do
    %__MODULE__{
      row: Enum.map(1..8, fn x ->
        %Cell{
          cell: %{
            x_position: x,
            y_position: y_position,
            piece: get_piece(pieces, x, y_position),
            player: get_player(player)
          }
        }
      end)
    }
  end

  @doc """
  Retrieves basic player information for a cell.

  Returns `nil` if the player is not provided.
  """
  def get_player(nil), do: nil

  def get_player(%Player{player: %{name: name, side: side}}) do
    %{
      name: name,
      side: side
    }
  end

  @doc """
  Finds a piece at the given position on the board.

  Returns `nil` if no piece is found or no pieces are provided.
  """
  def get_piece([], _x, _y_position), do: nil

  def get_piece(pieces, x, y_position) when is_list(pieces) do
    Enum.find(pieces, fn piece ->
      piece.piece[:x_position] == x and piece.piece[:y_position] == y_position
    end)
  end
end
