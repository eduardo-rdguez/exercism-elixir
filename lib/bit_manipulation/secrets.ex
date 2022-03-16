defmodule BitManipulation.Secrets do
  @moduledoc """
    Documentation for `BitManipulation.Secrets`.
  """

  def secret_and(secret) do
    &Bitwise.&&&(&1, secret)
  end

  def secret_xor(secret) do
    &Bitwise.^^^(&1, secret)
  end

  def secret_combine(secret_function1, secret_function2) do
    &secret_function2.(secret_function1.(&1))
  end
end
