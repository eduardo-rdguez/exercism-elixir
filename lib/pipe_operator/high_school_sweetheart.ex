defmodule PipeOperator.HighSchoolSweetheart do
  @moduledoc """
    Documentation for `PipeOperator.HighSchoolSweetheart`.
  """

  def first_letter(name) do
    name
    |> String.trim()
    |> String.first()
  end

  def initial(name) do
    name
    |> first_letter()
    |> String.upcase()
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    full_name
    |> String.split()
    |> Enum.map_join(" ", &initial(&1))
  end

  def pair(full_name_one, full_name_two) do
    i1 = initials(full_name_one)
    i2 = initials(full_name_two)

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{i1}  +  #{i2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
