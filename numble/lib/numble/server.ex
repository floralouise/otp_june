defmodule Numble.Server do
  use GenServer
  alias Numble.Game

  def start_link() do
    GenServer.start_link(__MODULE__, Game.new())
  end

  def init(game) do
    {:ok, game}
  end

  def handle_cast({:guess, guess}, game) do
    new_game = Game.make_guess(game, guess)
    {:noreply, new_game}
  end

  def handle_call(:show, _from, game) do
    {:reply, Game.show(game), game}
  end

  def guess(pid, guess) do
    GenServer.cast(pid, {:guess, guess})
  end

  def show(pid) do
    GenServer.call(pid, :show)
  end
end
