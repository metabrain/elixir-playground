defmodule ExCollections.Stack do
  defstruct stack: []
  def push(stack, e), do: [e|stack]
  def pop([e|stack]), do: {stack, e}
  def size([]), do: 0
  def size([_h|stack]), do: 1+size(stack)
  def empty?([]), do: true
  def empty?(_), do: false
  def peek([e|_stack]), do: e
end

defmodule ExCollections.Queue do
  # TODO This is a O(n) implementation and not O(1)...
  def add(queue, e), do: queue ++ [e]
  # TODO throw error if nothing to remove..?
  def remove([e|queue]), do: {queue, e}
  def peek([e]), do: e
  def peek([_e|queue]), do: peek(queue)
  def size([]), do: 0
  def size([_e|queue]), do: 1+size(queue)
  def empty?([]), do: true
  def empty?(_), do: false
end

# TODO add Collectable / Iterable protocol
defmodule ExCollections.BTree do
  def add({}, e), do: {e,{},{}}
  def add({val, l, r}, e) when e<=val, do: {val, add(l,e) , r}
  def add({val, l, r}, e) when e>val, do: {val, l, add(r,e)}

  def remove({}, e), do: raise "Element #{e} is not on tree!"
  def remove({e, {}, {}}, e), do: {} # node is removed
  def remove({e, {}, r }, e), do: {min(r), {}, remove(r, min(r))} # remove node and promote minimum from right
  def remove({e, l , r }, e), do: {max(l), remove(l, max(l)), r} # remove node and promote maximum from left
  def remove({val, l, r}, e) when e<=val, do: {val, remove(l,e) , r}
  def remove({val, l, r}, e) when e>val, do: {val, l, remove(r,e)}

  def contains({}, e), do: false
  def contains({e, _l, _r}, e), do: true
  def contains({val, l, r}, e) when e<val, do: contains(l,e)
  def contains({val, l, r}, e) when e>val, do: contains(r,e)

  def min({}), do: raise "Empty tree has no minimum!"
  def min({e, {}, _r}), do: e # nothing to left, then e is min
  def min({_, l , _r}), do: min(l) # keep going left while possible

  def max({}), do: raise "Empty tree has no minimum!"
  def max({e, _l, {}}), do: e # nothing to right, then e is max
  def max({_, _l, r }), do: max(r) # keep going right while possible

  def union({}, b), do: b
  def union(a, {}), do: a
  def union(a, b), do: Enum.reduce(to_list(a), b, fn(x, t) -> union(t, x, contains(t, x)) end)
  def union(t, x, true), do: t
  def union(t, x, false), do: add(t, x)

  # TODO intersection should done over a stream to avoid creating lists of all objects in memory
  def intersect({}, b), do: {}
  def intersect(a, {}), do: {}
  def intersect(a, b), do: Enum.reduce(to_list(a), {}, fn(x, t) -> intersect(x, t, b) end)
  def intersect(e, t, t2), do: intersect(e, t, t2, contains(t2, e))
  def intersect(e, t, t2, true), do: add(t, e)
  def intersect(e, t, t2, false), do: t

  def to_list({}), do: []
  def to_list({e, l, r}), do: to_list(l) ++ [e] ++ to_list(r)
end

defmodule ExCollections.AdjList do
  # map of adjacencies
  def add(m, {a,b}), do: m |> add_arc({a,b}) |> add_arc({b,a})
  def add_arc(m, {s,d}), do: Map.update(m, s, [d], &([d|&1]))

  # TODO for remove operation its more effective if it is a map of maps..?
  def remove(m, {a,b}), do: m |> remove_arc({a,b}) |> remove_arc({b,a})
  def remove_arc(m, {s,d}) do
    case m do
      %{^s => l} -> Enum.reduce(l, Map.delete(m, s), fn(x, m_acc) -> remove_arc_dest(m_acc, x, s) end)
      _ -> m
    end
  end
  

  def remove_arc_dest(m, s, d) do
    case m do
      %{^s => [d]} -> Map.delete(m, s)
      %{^s => l} -> Map.update(m, s, &(List.delete(&1, d)))
    end
  end
end
