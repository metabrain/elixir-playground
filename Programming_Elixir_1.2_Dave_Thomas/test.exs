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

end
