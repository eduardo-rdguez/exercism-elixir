defmodule Booleans.PacmanRulesTest do
  use ExUnit.Case
  alias Booleans.PacmanRules

  test "eat_ghost?/2 ghost gets eaten" do
    assert PacmanRules.eat_ghost?(true, true)
  end

  test "eat_ghost?/2 ghost does not get eaten because no power pellet active" do
    refute PacmanRules.eat_ghost?(false, true)
  end

  test "eat_ghost?/2 ghost does not get eaten because not touching ghost" do
    refute PacmanRules.eat_ghost?(true, false)
  end

  test "score?/2 score when eating dot" do
    assert PacmanRules.score?(false, true)
  end

  test "score?/2 score when eating power pellet" do
    assert PacmanRules.score?(true, false)
  end

  test "score?/2 no score when nothing eaten" do
    refute PacmanRules.score?(false, false)
  end

  test "lose?/2 lose if touching a ghost without a power pellet active" do
    assert PacmanRules.lose?(false, true)
  end

  test "lose?/2 don't lose if touching a ghost with a power pellet active" do
    refute PacmanRules.lose?(true, true)
  end

  test "lose?/2 don't lose if not touching a ghost" do
    refute PacmanRules.lose?(true, false)
  end

  test "win?/3 win if all dots eaten" do
    assert PacmanRules.win?(true, false, false)
  end

  test "win?/3 don't win if all dots eaten, but touching a ghost" do
    refute PacmanRules.win?(true, false, true)
  end

  test "win?/3 win if all dots eaten and touching a ghost with a power pellet active" do
    assert PacmanRules.win?(true, true, true)
  end
end
