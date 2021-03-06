defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
      sentence = String.replace(sentence, "_", " ")
      sentence = String.replace(sentence, "-", "_")
      words = List.flatten(Regex.scan(~r/\w+/iu, sentence))
      res = countWords(words)
      Enum.into(Enum.map(res, fn {k,v} -> {String.replace(k, "_", "-"), v} end), %{})
  end

  def incMap(n) do
    case n do
      nil -> {n, 1}
      x -> {n, n+1}
    end
  end

  def countWords([]), do: %{}
  def countWords([head|tail]) do
    head = String.downcase(head)
    elem(Map.get_and_update(countWords(tail), head, fn n -> incMap(n) end), 1)
  end
end
