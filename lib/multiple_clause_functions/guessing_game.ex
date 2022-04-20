defmodule MultipleClauseFunctions.GuessingGame do
  @moduledoc """
    Documentation for `MultipleClauseFunctions.GuessingGame`.
  """

  def compare(_), do: "Make a guess"
  def compare(secret_number, secret_number), do: "Correct"
  def compare(_, :no_guess), do: "Make a guess"
  def compare(secret_number, guess) when abs(secret_number - guess) == 1, do: "So close"
  def compare(secret_number, guess) when secret_number < guess, do: "Too high"
  def compare(secret_number, guess) when secret_number > guess, do: "Too low"
end
