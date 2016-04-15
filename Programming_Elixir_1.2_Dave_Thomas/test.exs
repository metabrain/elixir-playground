Code.load_file("chapter_05.exs")
Code.load_file("chapter_06.exs")
Code.load_file("chapter_07.exs")

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

  test "prefix" do
    assert Chapter_05.prefix().("Mrs").("Smith") === "Mrs Smith"
    assert Chapter_05.prefix().("Elixir").("Rocks") === "Elixir Rocks"
  end

  test "mytimes" do
    assert Chapter_06.Times.double(10) === 20
    assert Chapter_06.Times.triple(10) === 30
    assert Chapter_06.Times.quadruple(10) === 40
  end

  test "recsum" do
    assert Chapter_06.sum(2) === 3
    assert Chapter_06.sum(3) === 6
    assert Chapter_06.sum(4) === 10
  end

  test "gcd" do
    assert Chapter_06.gcd(54,24) === 6
  end

  test "guess" do
    assert Chapter_06.guess(273, 1..1000)
  end

  test "mapsum" do
    assert Chapter_07.mapsum([1,2,3], &(&1 * &1)) === 14
  end

  test "maxlist" do
    assert Chapter_07.maxlist([1,2,7,9,3,10,2,5,9]) === 10
  end

  test "caesar" do
    assert Chapter_07.caesar('ryvkve', 13) === 'elixir'
  end

  test "span" do
    assert Chapter_07.span(10,15) === [10, 11, 12, 13, 14, 15]
  end
end
