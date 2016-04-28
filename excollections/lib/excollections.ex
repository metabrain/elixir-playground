defmodule ExCollections.Stack do
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
