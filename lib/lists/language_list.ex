defmodule Lists.LanguageList do
  @moduledoc """
    Documentation for `Lists.LanguageList`.
  """

  @language "Elixir"

  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    tl(list)
  end

  def first(list) do
    hd(list)
  end

  def count(list) do
    length(list)
  end

  def exciting_list?(list) do
    @language in list
  end
end
