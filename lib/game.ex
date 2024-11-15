defmodule Chess.Game do
  @moduledoc "Represents a chess game."
  @enforce_keys [:game]
  @derive Jason.Encoder
  defstruct game: %{
    board: nil,
    players: nil,
    current_player: nil,
    winner: nil
  }

  alias Chess.Player
  alias Chess.Board
  alias Chess.Game

  @doc """
  Initializes a game with a board and two players.
  """
  def new do
    player_black = Player.new("Player 1", :black)
    player_white = Player.new("Player 2", :white)
    %Game{
      game: %{
        board: Board.new(player_black, player_white),
        players: [player_black, player_white],
        current_player: nil,
        winner: nil
      }
    }
  end
end
