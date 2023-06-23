defmodule Numble.Server do
  use GenServer
  alias Numble.Game

  def start_link(name \\ :numble) do
    IO.puts("starting #{name}")
    GenServer.start_link(__MODULE__, Game.new(), name: name)
  end

  def init(game) do
    {:ok, game}
  end

  def handle_call({:guess, guess}, _from, game) do
    new_game = Game.make_guess(game, guess)
    {:reply, Game.show(new_game), new_game}
  end

  # def handle_call(:show, _from, game) do
  #   {:reply, Game.show(game), game}
  # end

  def guess(pid \\ :numble, guess) do
    GenServer.call(pid, {:guess, guess})
    |> IO.puts
  end

  # def show(pid) do
  #   GenServer.call(pid, :show)
  # end

  def child_spec(name) do
    %{id: [name], start: {Numble.Server, :start_link, [name]}}
  end
end
