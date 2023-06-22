defmodule Numble.Game do
  defstruct guesses: [], answer: [1,2,3,4], status: :playing

  def new do
    answer = 1..8 |> Enum.shuffle() |> Enum.take(4)
    %__MODULE__{answer: answer}
  end

  def make_guess(game, guess) do
    guesses = [guess | game.guesses]
    %{game | guesses: guesses}
  end

  def show_rows(answer, guesses) do
    Enum.map(guesses, fn guess -> show_row(answer, guess) end)
  end

  def show(game) do
    """
    ? ? ? ?
    #{show_rows(game.answer, game.guesses)}

    status: playing
    """
  end

  def show_row(answer, guess) do
    "#{Enum.join(guess, " ")} | #{show_score(answer, guess)}\n"
  end

  def show_score(answer, guess) do
    reds =
      Enum.zip(answer, guess)
      |> Enum.filter(fn {a, b,} -> a == b end)
      |> length()
    missing =
      (guess -- answer) |> length
    whites =
      (4 - reds) - missing

    String.duplicate("R", reds) <> String.duplicate("W", whites)
  end

end
