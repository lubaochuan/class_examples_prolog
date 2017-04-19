move(Stacks, NewStacks):-
  select([Top|Stack1], Stacks, Rest),
  select(Stack2, Rest, OtherStacks),
  NewStacks = [Stack1,[Top|Stack2]|OtherStacks].

move_cyclefree(Visited, Node, NextNode):-
  move(Node, NextNode),
  \+ member(NextNode, Visited).

goal(Stacks):-
  member([a,b,c], Stacks).

solve_depthfirst_bound(Bound, Node, Path):-
  depthfirst_bound(Bound, [Node], Node, RevPath),
  reverse(RevPath, Path).

depthfirst_bound(_, Visited, Node, Visited):-
  goal(Node).

depthfirst_bound(Bound, Visited, Node, Path):-
  Bound > 0,
  move_cyclefree(Visited, Node, NextNode),
  NewBound is Bound - 1,
  depthfirst_bound(NewBound, [NextNode|Visited], NextNode, Path).

/** <examples> Your example queries go here, e.g.
?- solve_depthfirst_bound(2, [[c,a],[b],[]], Plan).
?- solve_depthfirst_bound(3, [[c,a],[b],[]], Plan).
*/
