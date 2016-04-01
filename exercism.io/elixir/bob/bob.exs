# Bob
# Bob is a lackadaisical teenager. In conversation, his responses are very limited.

# Bob answers 'Sure.' if you ask him a question.

# He answers 'Whoa, chill out!' if you yell at him.

# He says 'Fine. Be that way!' if you address him without actually saying anything.

# He answers 'Whatever.' to anything else.

defmodule Bob do

  def hey(input) do
    case input do
        "" -> "Fine. Be that way!"
        " " <> tail -> hey(tail)
        _ -> heyRec(String.codepoints(input), true, false)
   end
  end

  def heyRec([], false, _), do: "Whatever."
  def heyRec([], true, true), do: "Whoa, chill out!"
  def heyRec(["?"], _, _),  do: "Sure."
  def heyRec(l, yell, _) do
    head = hd(l)
    tail = tl(l)
    IO.puts("head: #{head} tail: #{tail} yell: #{yell}")
    # <> " tail: " <> tail <> " yell: " <> yell) 
    case String.upcase(head) do
       ^head -> heyRec(tail, yell)
       _ -> heyRec(tail, false)
    end
  end
end
