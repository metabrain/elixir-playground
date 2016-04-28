defmodule ExCollectionsTest.Stack do
  use ExUnit.Case
  doctest ExCollections.Stack

  test "push" do
    assert [] |> ExCollections.Stack.push(1) == [1]
    assert [] |> ExCollections.Stack.push(2) |> ExCollections.Stack.push(3)  == [3,2]
  end

  test "pop" do
    assert [3,2] |> ExCollections.Stack.pop == {[2], 3}
    assert [4] |> ExCollections.Stack.pop == {[], 4}
  end

  test "peek" do
    assert [5,4] |> ExCollections.Stack.peek == 5
    assert [4] |> ExCollections.Stack.peek == 4
  end

  test "size" do
    assert [1,2,3,4,5,""] |> ExCollections.Stack.size == 6
  end

  test "empty?" do
    assert [] |> ExCollections.Stack.empty? == true
    assert [""] |> ExCollections.Stack.empty? == false 
  end
end

defmodule ExCollectionsTest.Queue do
  use ExUnit.Case
  doctest ExCollections.Queue

  test "add" do
    assert [] |> ExCollections.Queue.add(1) == [1]
    assert [] |> ExCollections.Queue.add(2) |> ExCollections.Queue.add(3)  == [2,3]
  end

  test "remove" do
    assert [2,3] |> ExCollections.Queue.remove == {[3], 2}
    assert [4] |> ExCollections.Queue.remove == {[], 4}
  end

  test "peek" do
    assert [5,4] |> ExCollections.Queue.peek == 4
    assert [4] |> ExCollections.Queue.peek == 4
  end


  test "size" do
    assert [1,2,3,4,5,""] |> ExCollections.Queue.size == 6
  end

  test "empty?" do
    assert [] |> ExCollections.Queue.empty? == true
    assert [""] |> ExCollections.Queue.empty? == false 
  end
end
