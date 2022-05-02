defmodule Charlist.Username do
  @moduledoc """
  Sanitize existing usernames.
  """

  @doc """
  Sanitizes existing usernames by removing everything but lowercase letters.

  Does not remove the underscores from the username.
  Replaces German characters with their Latin counterparts.
  """
  @spec sanitize(charlist()) :: charlist()
  def sanitize(username) do
    Enum.reduce(username, '', fn char, acc ->
      acc ++ validate(char)
    end)
  end

  @spec validate(char()) :: charlist()
  defp validate(char) do
    case char do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      ?_ -> '_'
      c when c in ?a..?z -> [c]
      _ -> ''
    end
  end
end