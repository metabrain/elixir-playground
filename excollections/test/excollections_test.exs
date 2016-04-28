defmodule ExCollectionsTest.Stack do
  use ExUnit.Case
  doctest ExCollections.Stack

  test "push" do
    assert [] |> ExCollections.Stack.push(1) == [1]
    assert [] |> ExCollections.Stack.push(2) |> ExCollections.Stack.push(3)  == [3,2]
  end

  test "pop" do
    assert [5,4] |> ExCollections.Stack.pop == {[4], 5}
    assert [4] |> ExCollections.Stack.pop == {[], 4}
  end

  test "size" do
    assert [1,2,3,4,5,""] |> ExCollections.Stack.size == 6
  end

  test "empty?" do
    assert [] |> ExCollections.Stack.empty? == true
    assert [""] |> ExCollections.Stack.empty? == false 
  end
end
