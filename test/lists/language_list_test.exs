defmodule Lists.LanguageListTest do
  use ExUnit.Case
  alias Lists.LanguageList

  test "new/0 new list" do
    assert LanguageList.new() == []
  end

  test "add/2 add a language to a list" do
    language = "Elixir"
    list = [language]
    assert LanguageList.new() |> LanguageList.add(language) == list
  end

  test "add/2 add several languages to a list" do
    list =
      LanguageList.new()
      |> LanguageList.add("Erlang")
      |> LanguageList.add("Elixir")

    assert list == ["Elixir", "Erlang"]
  end

  test "remove/1 add then remove results in empty list" do
    list = LanguageList.new() |> LanguageList.add("Elixir")
    assert list |> LanguageList.remove() == []
  end

  test "remove/1 adding two languages, when removed, removes first item" do
    list =
      LanguageList.new()
      |> LanguageList.add("Erlang")
      |> LanguageList.add("Elixir")

    assert list |> LanguageList.remove() == ["Erlang"]
  end

  test "first/1 add one language, then get the first" do
    language = "Elixir"
    list = LanguageList.new() |> LanguageList.add(language)
    assert list |> LanguageList.first() == language
  end

  test "count/1 the count of a new list is 0" do
    assert LanguageList.new() |> LanguageList.count() == 0
  end

  test "count/1 the count of a new list is 1" do
    list = LanguageList.new() |> LanguageList.add("Elixir")
    assert list |> LanguageList.count() == 1
  end

  test "count/1 the count of a new list is 2" do
    list =
      LanguageList.new()
      |> LanguageList.add("Erlang")
      |> LanguageList.add("Elixir")

    assert list |> LanguageList.count() == 2
  end

  test "exciting_list?/1 an exciting language list" do
    list = LanguageList.new() |> LanguageList.add("Elixir")
    assert list |> LanguageList.exciting_list?()
  end

  test "test exciting_list?/1 not an exciting language list" do
    list = LanguageList.new() |> LanguageList.add("Erlang")
    refute list |> LanguageList.exciting_list?()
  end
end
