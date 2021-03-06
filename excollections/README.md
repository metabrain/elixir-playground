# ExCollections

Collection of several data structures and their implementation in Elixir, each containing benchmarks regarding their performance.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add excollections to your list of dependencies in `mix.exs`:

        def deps do
          [{:excollections, "~> 0.0.1"}]
        end

  2. Ensure excollections is started before your application:

        def application do
          [applications: [:excollections]]
        end

## Data structures

- [x] Stack
- [x] Queue
- [x] Binary Search Tree
- [ ] Graph (Adjacency Lists)
- [ ] Set
- [ ] Priority Queue
- [ ] Red-black Tree
- [ ] AVL Tree
- [ ] Bitset
- [ ] --Circular Queue-- irrelevant since it is only useful when data is mutable - which is not Elixir/Erlang VM's case.

## Algorithms

- [ ] DFS
- [ ] BFS
- [ ] Binary Search
- [ ] Dijkstra
- [ ] Floyd-Warshall
- [ ] A*
- [ ] MST (Minimum Spanning Tree)
