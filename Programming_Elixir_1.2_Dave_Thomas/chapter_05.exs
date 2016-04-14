defmodule Chapter_05 do

  def list_concat(l1, l2) do
    l1 ++ l2
  end

  def sum([]) do
    0
  end

  def sum([h|t]) do
    h + sum(t)
  end

  def pair_tuple_to_list({a,b}) do
    [a,b]
  end

end
