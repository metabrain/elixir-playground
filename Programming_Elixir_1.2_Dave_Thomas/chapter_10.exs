defmodule Chapter_10 do
  require Enum

  def all?([],_), do: true
  def all?([h|t], f), do: f.(h) and all?(t, f)

  def each([x], f), do: f.(x)
  def each([h|t], f) do
    f.(h)
    each(t, f)
  end

  def filter([], _), do: []
  def filter([h|t], f) do
    if f.(h) do
     [h|filter(t, f)]
    else
     filter(t, f)
    end 
  end

  def split(l, n), do: split(l, n, [])
  def split(l, 0, prev), do: {Enum.reverse(prev), l}
  def split([h|t], n, prev), do: split(t, n-1, [h|prev])

  def reverse([]), do: []
  def reverse([h|t]), do: reverse(t) ++ [h]

  def take([], _), do: []
  def take(_, 0), do: []
  def take([h|t], n), do: [h|take(t, n-1)]

  def flatten([]), do: []
  def flatten([h|t]), do: flatten(h)++flatten(t)
  def flatten(x), do: [x] # always a list
end
