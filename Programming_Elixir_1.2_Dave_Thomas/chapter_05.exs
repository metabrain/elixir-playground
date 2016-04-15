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

  def fizzbuzz(0,0,_), do: "FizzBuzz"
  def fizzbuzz(0,_,_), do: "Fizz"
  def fizzbuzz(_,0,_), do: "Buzz"
  def fizzbuzz(_,_,x), do: x

  def realFizzBuzz(n) do
    fizzbuzz(rem(n,3), rem(n,5), n)
  end

  myMap = Enum.map [1,2,3,4], &(&1 + 2)
  myInspectMap = Enum.map [1,2,3,4], &(IO.inspect(&1))

  def prefix() do 
    fn title -> 
      fn name -> 
        title <> " " <> name
      end
    end
  end

end
