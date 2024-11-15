defmodule Chess.Player do
  @moduledoc "Represents a player with its details."
  @enforce_keys [:player]
  @derive Jason.Encoder
  defstruct player: %{
    name: nil,
    side: nil,
    pieces: [],
    taken_pieces: [],
    in_draw: false,
    in_check: false,
    in_checkmate: false,
    in_resignation: false,
  }

  alias Chess.Piece

  @doc """
    Gets the list of pieces for a player.
  """
  def get_pieces(%Chess.Player{player: %{pieces: pieces}}), do: pieces
  def get_player(%Chess.Player{player: player}), do: player

  @doc """
    Initializes a player with the specified `name` and `side`.
  """
  def new(name, side) do
    %__MODULE__{
      player: %{
        name: name,
        side: side,
        pieces: assign_pieces(side),
        taken_pieces: [],
        in_draw: false,
        in_check: false,
        in_checkmate: false,
        in_resignation: false,
      }
    }
  end

  def assign_pieces(side) do
    starting_positions =
      if side == :white do
        [
          %{type: :rook, x: 1, y: 1, moviment: "C", moviment_length: 8},    # a1
          %{type: :knight, x: 2, y: 1, moviment: "Y", moviment_length: 3},  # b1
          %{type: :bishop, x: 3, y: 1, moviment: "X", moviment_length: 8},  # c1
          %{type: :queen, x: 4, y: 1, moviment: "XC", moviment_length: 8},  # d1
          %{type: :king, x: 5, y: 1, moviment: "XC", moviment_length: 1},   # e1
          %{type: :bishop, x: 6, y: 1, moviment: "X", moviment_length: 8},  # f1
          %{type: :knight, x: 7, y: 1, moviment: "Y", moviment_length: 3},  # g1
          %{type: :rook, x: 8, y: 1, moviment: "C", moviment_length: 8},    # h1
          %{type: :pawn, x: 1, y: 2, moviment: "XC", moviment_length: 1},   # a2
          %{type: :pawn, x: 2, y: 2, moviment: "XC", moviment_length: 1},   # b2
          %{type: :pawn, x: 3, y: 2, moviment: "XC", moviment_length: 1},   # c2
          %{type: :pawn, x: 4, y: 2, moviment: "XC", moviment_length: 1},   # d2
          %{type: :pawn, x: 5, y: 2, moviment: "XC", moviment_length: 1},   # e2
          %{type: :pawn, x: 6, y: 2, moviment: "XC", moviment_length: 1},   # f2
          %{type: :pawn, x: 7, y: 2, moviment: "XC", moviment_length: 1},   # g2
          %{type: :pawn, x: 8, y: 2, moviment: "XC", moviment_length: 1}    # h2
        ]
      else
         [
          %{type: :rook, x: 1, y: 8, moviment: "C", moviment_length: 8},    # a8
          %{type: :knight, x: 2, y: 8, moviment: "Y", moviment_length: 3},  # b8
          %{type: :bishop, x: 3, y: 8, moviment: "X", moviment_length: 8},  # c8
          %{type: :queen, x: 4, y: 8, moviment: "XC", moviment_length: 8},  # d8
          %{type: :king, x: 5, y: 8, moviment: "XC", moviment_length: 1},   # e8
          %{type: :bishop, x: 6, y: 8, moviment: "X", moviment_length: 8},  # f8
          %{type: :knight, x: 7, y: 8, moviment: "Y", moviment_length: 3},  # g8
          %{type: :rook, x: 8, y: 8, moviment: "C", moviment_length: 8},    # h8
          %{type: :pawn, x: 1, y: 7, moviment: "XC", moviment_length: 1},   # a7
          %{type: :pawn, x: 2, y: 7, moviment: "XC", moviment_length: 1},   # b7
          %{type: :pawn, x: 3, y: 7, moviment: "XC", moviment_length: 1},   # c7
          %{type: :pawn, x: 4, y: 7, moviment: "XC", moviment_length: 1},   # d7
          %{type: :pawn, x: 5, y: 7, moviment: "XC", moviment_length: 1},   # e7
          %{type: :pawn, x: 6, y: 7, moviment: "XC", moviment_length: 1},   # f7
          %{type: :pawn, x: 7, y: 7, moviment: "XC", moviment_length: 1},   # g7
          %{type: :pawn, x: 8, y: 7, moviment: "XC", moviment_length: 1}    # h7
        ]
      end


    Enum.map(starting_positions, fn position ->
      %Piece{
        piece: %{
          type: position[:type],
          x_position: position[:x],
          y_position: position[:y],
          moviment: position[:moviment],
          moviment_length: position[:moviment_length]
        }
      }
    end)
  end
end
