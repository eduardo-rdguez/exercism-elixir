defmodule If.NameBadge do
  @moduledoc """
    This module provides a name badge.
  """

  def print(id, name, department) do
    department = if department, do: String.upcase(department), else: "OWNER"
    prefix = if id, do: "[#{id}] - ", else: ""

    prefix <> "#{name} - #{department}"
  end
end
