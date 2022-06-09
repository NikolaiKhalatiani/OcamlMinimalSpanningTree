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
<p>You may freely choose your algorithm. 
Note, that the function returns
the subgraph that forms the minimum spanning tree. 
The edges may be output in any
order.</p>
<p><em>Hint: The <code>List</code> module provides a lot of useful functions for this assignment!</em>
<em>Hint: Our sample solution uses <a rel="noopener noreferrer" href="https://en.wikipedia.org/wiki/Prim%27s_algorithm">Prim’s algorithm</a>, however, you may choose your favourite algorithm</em><br>
<em>Hint: You may assume that the input graph is connected.</em></p>  

## Examples
```ocaml
utop # mst [0,1.,1; 0,4.,2; 1,2.,2; 1,1.,3; 2,3.,3];;
- : graph = [(1, 2., 2); (1, 1., 3); (0, 1., 1)]
```
```ocaml
utop # mst [0,4.,1; 0,4.,7; 1,8.,2; 1,11.,7; 2,7.,3; 2,4.,5; 2,2.,8; 3,9.,4; 3,14.,5; 4,10.,5; 5,2.,6; 6,1.,7; 6,6.,8; 7,7.,8;];;
- : graph =[(3, 9., 4); (2, 7., 3); (2, 2., 8); (5, 4., 2); (6, 2., 5); (7, 1., 6); (0, 4., 7); (0, 4., 1)]
```


