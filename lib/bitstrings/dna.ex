defmodule BitStrings.DNA do
  @moduledoc """
    This module encodes and decodes DNA sequence in a binary representation.
  """

  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode(dna), do: do_encode(dna, <<0::size(0)>>)

  def do_encode([], response), do: response

  def do_encode([h | t], response) do
    do_encode(t, <<response::bitstring, encode_nucleotide(h)::4>>)
  end

  def decode(dna), do: do_decode(dna, '')

  def do_decode(<<0::0>>, response), do: response

  def do_decode(<<h::4, t::bitstring>>, response) do
    do_decode(t, response ++ [decode_nucleotide(h)])
  end
end
