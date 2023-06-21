defmodule Summer.CounterInt do

  def new(input) do
    String.to_integer(input)
  end

  def inc(i) do
    i + 1
  end

  def dec(i) do
    i - 1
  end

  def show(i) do
    "The answarrrrr is #{i}"
  end

end
