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

defmodule ExCollectionsTest.BTree do
  use ExUnit.Case
  doctest ExCollections.BTree

  @a {10,{5,{2,{},{}},{7,{},{}}},{20,{},{}}}
  @b {8, {3,{},{}} , {15, {13,{},{}}, {} } }
 
  test "to_list" do
    assert @a |> ExCollections.BTree.to_list == [2,5,7,10,20]
    assert {} |> ExCollections.BTree.to_list == []
  end

  test "add" do
    assert {} |> ExCollections.BTree.add(1) |> ExCollections.BTree.to_list == [1]
    assert {} |> ExCollections.BTree.add(2) |> ExCollections.BTree.add(3) |> ExCollections.BTree.add(1) |> ExCollections.BTree.to_list == [1,2,3]
  end

  test "contains" do
     assert @a |> ExCollections.BTree.contains(10) == true
     assert @a |> ExCollections.BTree.contains(7) == true
     assert @a |> ExCollections.BTree.contains(21) == false
     assert @b |> ExCollections.BTree.contains(3) == true
     assert @a |> ExCollections.BTree.contains(16) == false
  end

  test "min" do
    assert @a |> ExCollections.BTree.min == 2
    assert @b |> ExCollections.BTree.min == 3
  end

  test "max" do
    assert @a |> ExCollections.BTree.max == 20
    assert @b |> ExCollections.BTree.max == 15
  end

  test "remove" do
    assert @a |> ExCollections.BTree.remove(2)  |> ExCollections.BTree.to_list == [5,7,10,20]
    assert @a |> ExCollections.BTree.remove(5)  |> ExCollections.BTree.to_list == [2,7,10,20]
    assert @a |> ExCollections.BTree.remove(7)  |> ExCollections.BTree.to_list == [2,5,10,20]
    assert @a |> ExCollections.BTree.remove(10) |> ExCollections.BTree.to_list == [2,5,7,20]
    assert @a |> ExCollections.BTree.remove(20) |> ExCollections.BTree.to_list == [2,5,7,10]
  end

  test "union" do
    assert {} |> ExCollections.BTree.union({}) |> ExCollections.BTree.to_list == []
    assert @a |> ExCollections.BTree.union({})  == @a
    assert @a |> ExCollections.BTree.union(@b) |> ExCollections.BTree.to_list == [2,3,5,7,8,10,13,15,20]
  end

  test "intersect" do
    assert ExCollections.BTree.intersect(@a, @b) == {}
    assert ExCollections.BTree.intersect(@a, (@b |> ExCollections.BTree.add(20) |> ExCollections.BTree.add(7) |> ExCollections.BTree.add(55))) |> ExCollections.BTree.to_list == [7,20]
  end

end

defmodule ExCollectionsTest.AdjList do
  use ExUnit.Case
  doctest ExCollections.AdjList

  test "add" do
    assert %{1 => [2], 2 => [1]} == %{} |> ExCollections.AdjList.add {1,2}
  end
  
  test "remove" do
    assert %{} == %{1 => [2], 2 => [1]} |> ExCollections.AdjList.remove {1,2}
  end

end

