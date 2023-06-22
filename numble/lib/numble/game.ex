defmodule Numble.Game do
  defstruct guesses: [], answer: [1,2,3,4], status: :playing

  def new do
    answer = 1..8 |> Enum.shuffle() |> Enum.take(4)
    %__MODULE__{answer: answer}
  end

  def make_guess(game, guess) do
    guesses = [guess | game.guesses]

    %{game | guesses: guesses}
    |> apply_status()
  end

  def show(game) do
    """
    ? ? ? ?
    #{show_rows(game.answer, game.guesses)}

    status: #{game.status}
    """
  end

  defp show_rows(answer, guesses) do
    Enum.map(guesses, fn guess -> show_row(answer, guess) end)
  end

  defp show_row(answer, guess) do
    "#{Enum.join(guess, " ")} | #{show_score(answer, guess)}\n"
  end

  defp show_score(answer, guess) do
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

  defp apply_status(game) do
    %{game | status: status(game)}
  end

  defp status(%{ answer: answer, guesses: [answer | _guesses]}) do
    :won
  end

  defp status(game) do
    cond do
      length(game.guesses) < 10 -> :playing
      true -> :lost
    end
  end

end
