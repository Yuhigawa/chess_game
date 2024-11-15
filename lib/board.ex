defmodule Chess.Board do
  @moduledoc """
    Represents a chessboard with 8 rows and 8 cells in each row.

    - Rows 8 and 1: Back row pieces for black and white, respectively.
    - Rows 7 and 2: Pawns for black and white, respectively.
    - Other rows are empty.
  """
  @enforce_keys [:board]
  @derive Jason.Encoder
  defstruct board: []

  alias Chess.Row

  @doc """
    Initializes a chessboard with 8 rows and places the player's pieces.
  """
  # def new(player_black, player_white) do
  #   %__MODULE__{
  #     board: Enum.map(1..8, fn y ->
  #       cond do
  #         y == 8 -> Row.new(y, get_player_pieces(player_black), player_black)
  #         y == 7 -> Row.new(y, get_pawns_for_row(player_black, y), player_black)  # Black's pawns
  #         y == 2 -> Row.new(y, get_pawns_for_row(player_white, y), player_white)  # White's pawns
  #         y == 1 -> Row.new(y, get_player_pieces(player_white), player_white)
  #         true -> Row.new(y)
  #       end
  #     end)
  #   }
  # end

  def new(player_black, player_white) do
    %__MODULE__{
      board: [
        Row.new(8, get_player_pieces(player_black, 8), player_black),
        Row.new(7, get_player_pieces(player_black, 7), player_black),
        Row.new(6),
        Row.new(5),
        Row.new(4),
        Row.new(3),
        Row.new(2, get_player_pieces(player_white, 2), player_white),
        Row.new(1, get_player_pieces(player_white, 1), player_white),
      ]
    }
  end

  defp get_player_pieces(player, row_y) when row_y == 7 or row_y == 2 do
    Chess.Player.get_pieces(player)
    |> Enum.filter(fn piece -> piece.piece.y_position == row_y and piece.piece.type == :pawn end)
  end

  defp get_player_pieces(player, row_y) do
    Chess.Player.get_pieces(player)
    |> Enum.filter(fn piece -> piece.piece.y_position == row_y end)
  end
end
