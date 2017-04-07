Searching a directed graph.
![GitHub Logo](/images/graph_search.png)
```mermaid
graph LR
  e --> f
  a --> b
  a --> c
  b --> c
  b --> f
  d --> a
  f --> c
  g --> d
  g --> h
  e --> d
  h --> f
```

# Test Path
Implement ```cango(X,Y)```to test whether there is a path from ```X``` to ```Y```.
[solution](can_go.pl)
[algorithm source](https://www.cse.unsw.edu.au/~billw/cs9414/notes/prolog/path-trace.html)
