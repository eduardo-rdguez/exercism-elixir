defmodule Tuples.KitchenCalculator do
  @moduledoc """
    Documentation for `Tuples.KitchenCalculator`.
  """

  @measurements %{
    milliliter: 1,
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15
  }

  def get_volume({_unit, volume}) do
    volume
  end

  def to_milliliter({unit, volume}) do
    conversion = volume * @measurements[unit]
    {:milliliter, conversion}
  end

  def from_milliliter({:milliliter, volume}, unit) do
    conversion = volume / @measurements[unit]
    {unit, conversion}
  end

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end
