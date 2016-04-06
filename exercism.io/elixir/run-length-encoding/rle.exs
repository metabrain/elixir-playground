defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    ops = Regex.scan(~r/([aA-zZ]\1+)/iu, string, capture: :all)

    [aA-zZ])\1
    [aA-zZ])\1
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    ops = Regex.scan(~r/\d+\w/iu, string, capture: :all)
    IO.puts "ops = #{ops}"
    Enum.reduce(ops, "", fn(op,acc) -> acc <> decodeOp(op) end)
  end

  @spec decodeOp(String.t) :: String.t
  def decodeOp(string) do
    [op] = string
    IO.puts "decodeOp(#{op})"
    [n, c] = Regex.run(~r/(\d+)(\w)/iu, op, capture: :all_but_first)
    String.duplicate(c, elem(Integer.parse(n), 0))
  end
end
