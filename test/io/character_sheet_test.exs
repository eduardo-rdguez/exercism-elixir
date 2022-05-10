defmodule Io.CharacterSheetTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias Io.CharacterSheet

  test "welcome/0 it prints a welcome message" do
    io = capture_io(fn -> assert CharacterSheet.welcome() == :ok end)
    assert io == "Welcome! Let's fill out your character sheet together.\n"
  end

  test "ask_name/0 it prints a prompt" do
    io = capture_io("\n", fn -> CharacterSheet.ask_name() end)
    assert io == "What is your character's name?\n"
  end

  test "ask_name/0 returns the trimmed input" do
    capture_io("Maxwell The Great\n", fn ->
      assert CharacterSheet.ask_name() == "Maxwell The Great"
    end)
  end

  test "ask_class/0 it prints a prompt" do
    io = capture_io("\n", fn -> CharacterSheet.ask_class() end)
    assert io == "What is your character's class?\n"
  end

  test "ask_class/0 returns the trimmed input" do
    capture_io(
      "rogue\n",
      fn -> assert CharacterSheet.ask_class() == "rogue" end
    )
  end

  test "ask_level/0 it prints a prompt" do
    io = capture_io("1\n", fn -> CharacterSheet.ask_level() end)
    assert io == "What is your character's level?\n"
  end

  test "ask_level/0 returns the trimmed input as an integer" do
    capture_io("3\n", fn -> assert CharacterSheet.ask_level() == 3 end)
  end

  test "run/0 it returns a character map" do
    capture_io("The Stranger\nrogue\n2\n", fn ->
      assert CharacterSheet.run() == %{name: "The Stranger", class: "rogue", level: 2}
    end)
  end

  test "run/0 it inspects the character map" do
    io = capture_io("Anne\nhealer\n4\n", fn -> CharacterSheet.run() end)
    assert io =~ "\nYour character: " <> inspect(%{name: "Anne", class: "healer", level: 4})
  end
end
