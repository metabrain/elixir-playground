defmodule ExCollections.Stack do
  def push(stack, e), do: [e|stack]
  def pop([e|stack]), do: {stack, e}
  def size([]), do: 0
  def size([_h|stack]), do: 1+size(stack)
  def empty?([]), do: true
  def empty?(_), do: false
  def peek([e|_stack]), do: e
end
