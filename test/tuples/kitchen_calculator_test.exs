defmodule Tuples.KitchenCalculatorTest do
  use ExUnit.Case
  alias Tuples.KitchenCalculator

  test "get volume from tuple pair get cups" do
    assert KitchenCalculator.get_volume({:cup, 1}) == 1
  end

  test "get volume from tuple pair get fluid ounces" do
    assert KitchenCalculator.get_volume({:fluid_ounce, 2}) == 2
  end

  test "convert to milliliters from milliliters" do
    assert KitchenCalculator.to_milliliter({:milliliter, 3}) == {:milliliter, 3}
  end

  test "convert to milliliters from cups" do
    assert KitchenCalculator.to_milliliter({:cup, 3}) == {:milliliter, 720}
  end

  test "convert from milliliters to teaspoon" do
    expected = {:teaspoon, 12.25}
    assert KitchenCalculator.from_milliliter({:milliliter, 61.25}, :teaspoon) == expected
  end

  test "convert from milliliters to tablespoon" do
    expected = {:tablespoon, 4.75}
    assert KitchenCalculator.from_milliliter({:milliliter, 71.25}, :tablespoon) == expected
  end

  test "convert from x to y: teaspoon to tablespoon" do
    assert KitchenCalculator.convert({:teaspoon, 15}, :tablespoon) == {:tablespoon, 5}
  end

  test "convert from x to y: cups to fluid ounces" do
    assert KitchenCalculator.convert({:cup, 4}, :fluid_ounce) == {:fluid_ounce, 32}
  end
end
