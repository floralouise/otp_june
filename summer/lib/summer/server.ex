defmodule Summer.Server do
  use GenServer
  alias Summer.CounterInt

  def start_link(input) do
    GenServer.start_link(__MODULE__, input)
  end

  def init(input) do
    {:ok, CounterInt.new(input)}
  end

  def handle_cast(:inc, counter) do
    {:noreply, CounterInt.inc(counter)}
  end

  def handle_cast(:dec, counter) do
    {:noreply, CounterInt.dec(counter)}
  end

  def handle_call(:show, _from, counter) do
    {:reply, CounterInt.show(counter), counter}
  end

  def inc(pid) do
    GenServer.cast(pid, :inc)
  end

  def dec(pid) do
    GenServer.cast(pid, :dec)
  end

  def show(pid) do
    GenServer.call(pid, :show)
  end
end
