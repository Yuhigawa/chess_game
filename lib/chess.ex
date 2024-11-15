defmodule Chess do
  alias Chess.Game
  def start_game do
    game = Game.new()
    File.write!("game.json", Jason.encode!(game))
    # IO.puts("Game started!")
    # IO.puts("Board: #{inspect(game.board)}")
  end
end
