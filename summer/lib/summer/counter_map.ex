defmodule Summer.CounterMap do
  def new(input) do
    input = String.to_integer(input)
    %{count: input}
  end

  def inc(acc) do
   {_num, incremented_map} = acc |> Map.get_and_update(:count, fn x -> {x, x + 1} end)
    incremented_map
  end

  def dec(acc) do
    {_num, decremented_map} = acc |> Map.get_and_update(:count, fn x -> {x, x - 1} end)
    decremented_map
   end

  def show(acc) do
    IO.puts("What's a pirate's favorite thing to do? Watch the Sea-nery!! And they like the number #{acc.count}")
  end
end


map = Summer.CounterMap.new("1")
IO.inspect(map |> Summer.CounterMap.inc())
IO.inspect(map |> Summer.CounterMap.dec())
IO.inspect(map |> Summer.CounterMap.show())
