defmodule BitManipulation.SecretsTest do
  use ExUnit.Case
  alias BitManipulation.Secrets

  test "secret_and 2 and 1" do
    ander = Secrets.secret_and(1)
    assert ander.(2) === 0
  end

  test "secret_xor 2 xor 1" do
    xorer = Secrets.secret_xor(1)
    assert xorer.(2) === 3
  end

  test "secret_combine 4 and 3 then xor 7" do
    ander = Secrets.secret_and(3)
    xorer = Secrets.secret_xor(7)
    combine = Secrets.secret_combine(ander, xorer)
    assert combine.(4) === 7
  end
end
