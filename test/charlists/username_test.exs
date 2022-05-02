defmodule Charlist.UsernameTest do
  use ExUnit.Case
  alias Case.Username

  test "sanitize/1 works for an empty charlist" do
    assert Username.sanitize([]) == []
  end

  test "sanitize/1 it keeps lowercase latin letters" do
    input = Enum.to_list(0..1_114_111) -- [95, 223, 228, 246, 252]
    expected = 'abcdefghijklmnopqrstuvwxyz'
    actual = Username.sanitize(input)
    assert Enum.take(actual, Enum.count(expected)) == expected
    assert Enum.count(actual) == Enum.count(expected)
  end

  test "sanitize/1 it keeps underscores" do
    assert Username.sanitize('marcel_huber') == 'marcel_huber'
  end

  test "sanitize/1 it substitutes german letters" do
    assert Username.sanitize([107, 114, 252, 103, 101, 114]) == 'krueger'
    assert Username.sanitize([107, 246, 104, 108, 101, 114]) == 'koehler'
    assert Username.sanitize([106, 228, 103, 101, 114]) == 'jaeger'
    assert Username.sanitize([103, 114, 111, 223]) == 'gross'
  end
end
