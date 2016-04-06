defmodule Acronym do
  import String 

  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string = replace(string, "-", " ")
    string = removePunctuation(string)
    words = split(string, " ")
    acr = elem(Enum.map_reduce(words, "", fn w, acc -> {w, initials(w) <> acc} end), 1)
    reverse(upcase(acr))
  end

  def initials(w) do
    IO.inspect reverse(capitals(codepoints(w)))
    case replace(reverse(capitals(codepoints(w)))," ","") do
      "" -> upcase(first(w))
      x -> x
    end
  end

  def capitals(cs) do
    case cs do
       [h|t] -> 
        cond do
          h == upcase(h) -> h <> capitals(t)
          true -> capitals(t)
        end
      [] -> ""
   end
  end

  def removePunctuation(s) do
    String.replace(s, ~r/[\p{P}\p{S}]/, "")
  end
end
