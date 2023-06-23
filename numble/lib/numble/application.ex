defmodule Numble.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Numble.Worker.start_link(arg)
      {Numble.Server, :groot},
      {Numble.Server, :prof_x},
      {Numble.Server, :scarlet_witch},
      {Numble.Server, :wonder_woman},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Numble.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
