Code.load_file("chapter_05.exs")

ExUnit.start
#ExUnit.configure exclude: :pending, trace: true

defmodule Test do
  use ExUnit.Case

  test "list_concat" do
    assert Chapter_05.list_concat([:a, :b], [:c, :d]) === [:a, :b, :c, :d]
  end

  test "sum" do
    assert Chapter_05.sum([1,2,3]) === 6
  end

  test "pair_tuple_to_list" do
    assert Chapter_05.pair_tuple_to_list({1234,5678}) === [1234,5678]
  end

  test "fizz_fizz" do
    assert Chapter_05.fizzbuzz(0,1,1) === "Fizz"
  end
  test "fizz_buzz" do
    assert Chapter_05.fizzbuzz(1,0,1) === "Buzz"
  end
  test "fizz_c" do
    assert Chapter_05.fizzbuzz(1,1,6) === 6
  end
  test "fizz_buzzzz" do
    assert Chapter_05.fizzbuzz(0,0,6) === "FizzBuzz"
  end

  test "real_fizzbuzz" do
    assert Chapter_05.realFizzBuzz(10) == "Buzz"
    assert Chapter_05.realFizzBuzz(11) == 11
    assert Chapter_05.realFizzBuzz(12) == "Fizz"
    assert Chapter_05.realFizzBuzz(13) == 13
    assert Chapter_05.realFizzBuzz(14) == 14
    assert Chapter_05.realFizzBuzz(15) == "FizzBuzz"
    assert Chapter_05.realFizzBuzz(16) == 16
  end
end
