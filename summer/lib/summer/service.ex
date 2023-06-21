defmodule Summer.Service do
  alias Summer.CounterInt, as: CounterInt
 
  def start_link(input) do
   spawn_link(fn () -> loop(CounterInt.new(input)) end)
  end

  def loop(counter) do
    counter 
    |> listen()
    |> loop()
  end

  def listen(counter) do
    receive do
        :inc -> CounterInt.inc(counter)
        :dec -> CounterInt.dec(counter)
        {:show, counter_pid} -> 
          result = CounterInt.show(counter)
          send(counter_pid, result)
          counter
    end

  end

end