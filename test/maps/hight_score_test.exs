defmodule Maps.HighScoreTest do
  use ExUnit.Case
  alias Maps.HighScore

  test "new/1 result in empty score map" do
    assert Maps.HighScore.new() == %{}
  end

  test "add_player/2 add player without score to empty score map" do
    scores = HighScore.new()
    assert Maps.HighScore.add_player(scores, "José Valim") == %{"José Valim" => 0}
  end

  test "add_player/2 add player with score to empty score map" do
    scores = HighScore.new()
    assert Maps.HighScore.add_player(scores, "José Valim", 486_373) == %{"José Valim" => 486_373}
  end

  test "remove_player/2 remove from empty score map results in empty score map" do
    scores = HighScore.new()
    assert Maps.HighScore.remove_player(scores, "José Valim") == %{}
  end

  test "remove_player/2 remove player after adding results in empty score map" do
    scores =
      HighScore.new()
      |> Maps.HighScore.add_player("José Valim", 486_373)
      |> Maps.HighScore.remove_player("José Valim")

    assert scores == HighScore.new()
  end

  test "reset_score/2 resetting score for existing player sets previous player score to 0" do
    scores =
      HighScore.new()
      |> Maps.HighScore.add_player("José Valim", 486_373)
      |> Maps.HighScore.reset_score("José Valim")

    scores == %{"José Valim" => 0}
  end

  test "update_score/3 update score for non existent player initializes value" do
    scores =
      HighScore.new()
      |> HighScore.update_score("José Valim", 486_373)

    assert scores == %{"José Valim" => 486_373}
  end

  test "update_score/3 update score for existing player with non-zero score adds score to previous" do
    scores =
      HighScore.new()
      |> Maps.HighScore.add_player("José Valim", 486_373)
      |> Maps.HighScore.update_score("José Valim", 5)

    assert scores == %{"José Valim" => 486_378}
  end

  test "get_players/1 score map with multiple entries gives results in unknown order" do
    players =
      HighScore.new()
      |> HighScore.add_player("José Valim", 486_373)
      |> HighScore.add_player("Dave Thomas", 2374)
      |> HighScore.add_player("Chris McCord", 0)
      |> HighScore.add_player("Saša Jurić", 762)
      |> HighScore.get_players()
      |> Enum.sort()

    assert players == ["Chris McCord", "Dave Thomas", "José Valim", "Saša Jurić"]
  end
end
