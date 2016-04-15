defmodule Chapter_07 do

  @zed Enum.at('z', 0)
  @aes Enum.at('a', 0)

  def mapsum([], _), do: 0
  def mapsum([head|tail], fun), do: fun.(head) + mapsum(tail, fun)

  def maxlist([x]), do: x
  def maxlist([head|tail]), do: max(head, maxlist(tail))

  def caesar([], _), do: []
  def caesar([h|t], n), do: [@aes+rem(h-@aes+n, @zed-@aes+1) | caesar(t, n)]

  def span(from, to) when from == to, do: [to]
  def span(from, to), do: [from|span(from+1, to)]
end
