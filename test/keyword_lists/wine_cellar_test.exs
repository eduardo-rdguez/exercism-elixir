defmodule KeywordLists.WineCellarTest do
  use ExUnit.Case
  alias KeywordLists.WineCellar

  test "explain_colors/0 returns a keyword list" do
    expected = [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]

    assert WineCellar.explain_colors() == expected
  end

  test "filter/3 works for empty cellar" do
    assert WineCellar.filter([], :rose) == []
  end

  test "filter/3 returns all wines of a chosen color" do
    cellar = [
      white: {"Chardonnay", 2015, "Italy"},
      white: {"Chardonnay", 2014, "France"},
      rose: {"Dornfelder", 2018, "Germany"},
      red: {"Merlot", 2015, "France"},
      white: {"Riesling ", 2017, "Germany"},
      white: {"Pinot grigio", 2015, "Germany"},
      red: {"Pinot noir", 2016, "France"},
      red: {"Pinot noir", 2013, "Italy"}
    ]

    expected = [
      {"Chardonnay", 2015, "Italy"},
      {"Chardonnay", 2014, "France"},
      {"Riesling ", 2017, "Germany"},
      {"Pinot grigio", 2015, "Germany"}
    ]

    assert WineCellar.filter(cellar, :white) == expected
  end

  test "filter/3 filters wines of chosen color by year" do
    cellar = [
      white: {"Chardonnay", 2015, "Italy"},
      white: {"Chardonnay", 2014, "France"},
      rose: {"Dornfelder", 2018, "Germany"},
      red: {"Merlot", 2015, "France"},
      white: {"Riesling ", 2017, "Germany"},
      white: {"Pinot grigio", 2015, "Germany"},
      red: {"Pinot noir", 2016, "France"},
      red: {"Pinot noir", 2013, "Italy"}
    ]

    expected = [
      {"Chardonnay", 2015, "Italy"},
      {"Pinot grigio", 2015, "Germany"}
    ]

    assert WineCellar.filter(cellar, :white, year: 2015) == expected
  end

  test "filter/3 filters wines of chosen color by country" do
    cellar = [
      white: {"Chardonnay", 2015, "Italy"},
      white: {"Chardonnay", 2014, "France"},
      rose: {"Dornfelder", 2018, "Germany"},
      red: {"Merlot", 2015, "France"},
      white: {"Riesling ", 2017, "Germany"},
      white: {"Pinot grigio", 2015, "Germany"},
      red: {"Pinot noir", 2016, "France"},
      red: {"Pinot noir", 2013, "Italy"}
    ]

    expected = [
      {"Merlot", 2015, "France"},
      {"Pinot noir", 2016, "France"}
    ]

    assert WineCellar.filter(cellar, :red, country: "France") == expected
  end

  test "filter/3 filters wines of chosen color by country and year" do
    cellar = [
      white: {"Chardonnay", 2015, "Italy"},
      white: {"Chardonnay", 2014, "France"},
      rose: {"Dornfelder", 2018, "Germany"},
      red: {"Merlot", 2015, "France"},
      white: {"Riesling ", 2017, "Germany"},
      white: {"Pinot grigio", 2015, "Germany"},
      red: {"Pinot noir", 2016, "France"},
      red: {"Pinot noir", 2013, "Italy"}
    ]

    expected = [{"Merlot", 2015, "France"}]

    assert WineCellar.filter(cellar, :red, country: "France", year: 2015) == expected
  end
end
