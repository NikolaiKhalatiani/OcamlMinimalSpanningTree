type graph = (int * float * int) list

let mst (graph:graph) = let rec iter_tree graph list = match graph with []->[]
|(l,price,r)::rest-> if List.mem l list = false then if List.mem r (l::list) = false 
                    then l::r::iter_tree rest (l::r::list) else l::iter_tree rest (l::list)
                    else if List.mem r list = false  then  r::iter_tree rest (r::list) else iter_tree rest list in
    let uniqe_nodes = iter_tree graph [] in let rec helper pointer graph checked_nodes conections (spanning_tree:graph)  =
    let find_min_price (_,price1,_) (_,price2,_) = compare price1 price2 in 
    let find_first (x,c,y) = x in let find_last (x,c,y) = y in  let comparer x y = x = y in
    let min_price list = List.fold_left (fun y x-> if (find_min_price x y)  < 0 then x else y) (List.hd list) (List.tl list) in
    let push_edge edge list = match list with []->[edge] | _->edge::list in
    let delete_exact (a,c,b) connections = List.filter (fun (x,c1,y)-> (comparer (a,c,b) (x,c1,y)) = false)  connections in
    let split dest edge uniqes  = List.filter (fun (x,_,y)->(List.mem x edge && y = dest)||(List.mem y edge && x = dest)) uniqes in
    let list_cleaner pointer checked_nodes = List.filter (fun x -> x <> pointer) checked_nodes in
                    match checked_nodes with [x]->spanning_tree
                    |_->let create_checked_nodes = list_cleaner pointer checked_nodes in
                        let edge = split pointer checked_nodes graph in let create_edges = edge@conections in
                        let cheapest = create_edges |> min_price in
                        if List.mem (cheapest |> find_last) create_checked_nodes = false && List.mem (cheapest |>find_first) create_checked_nodes = false 
                        then helper  pointer (delete_exact cheapest graph) checked_nodes (delete_exact cheapest conections) spanning_tree
                        else let create_edgess = delete_exact cheapest create_edges in let create_graph = delete_exact cheapest graph in 
                        if List.mem (cheapest |> find_last) create_checked_nodes = false
                        then helper (cheapest |> find_first) create_graph create_checked_nodes create_edgess (push_edge cheapest spanning_tree ) 
                        else helper  (cheapest |> find_last) create_graph create_checked_nodes create_edgess (push_edge cheapest spanning_tree )
in 
    helper  (List.hd uniqe_nodes) graph uniqe_nodes [] []
