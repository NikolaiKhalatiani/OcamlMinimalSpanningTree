# Minimal Spanning Tree
Rather big Home Assignment from Functional Programming Course in KIU

<p>We define a weighted undirected graph by the list of its edges:</p>  

```ocaml
type graph = (int * float * int) list
```
<p>Thus, <code>[(0,1.5,1); (0,2.5,2)]</code> represents the graph containing nodes 0, 1, 2 and edges
with weight 1.5 and 2.5 between node 0 and nodes 1 and 2, respectively.</p>  

### mst
Implement a function mst : <code>graph -> graph</code> that computes the minimum spanning tree for the given graph.

