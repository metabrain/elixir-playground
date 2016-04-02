defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
      countWords(Regex.run(~r/\w+/iu, sentence))
  end

  def incMap(n) do
    case n do
      nil -> {n, 1}
      x -> {n, n+1}
    end
  end

  def countWords([]), do: %{}
  def countWords([head|tail]) do
    IO.puts "head #{head}"
    elem(Map.get_and_update(countWords(tail), head, fn n -> incMap(n) end), 1)
  end
end
