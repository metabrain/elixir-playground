defmodule Chapter_06 do

  defmodule Times do
    def double(n), do: n*2
    def triple(n), do: n*3
    def quadruple(n), do: double double n
  end

  def sum(1), do: 1
  def sum(n), do: n + sum(n-1)

  def gcd(x,0), do: x
  def gcd(x,y), do: gcd(y,rem(x,y))

  def mid_of_range(a..b) do
    div(b-a,2)+a
  end

  def guess(actual, a..b) do
    guess(actual, a..b, mid_of_range a..b)
  end

  def guess(actual, a..b, mid) when mid == actual do
    IO.puts mid 
  end

  def guess(actual, a..b, mid) when actual > mid do
    IO.puts "> Is it #{mid}"
    new_mid = mid_of_range a..b
    guess(actual, new_mid..b, mid_of_range new_mid..b)
  end
  def guess(actual, a..b, mid) when actual < mid do
    IO.puts "< Is it #{mid}"
    new_mid = mid_of_range a..b
    guess(actual, a..new_mid, mid_of_range a..new_mid)
  end




end
