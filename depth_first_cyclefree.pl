move(Stacks, NewStacks):-
  select([Top|Stack1], Stacks, Rest),
  select(Stack2, Rest, OtherStacks),
  NewStacks = [Stack1,[Top|Stack2]|OtherStacks].

move_cyclefree(Visited, Node, NextNode):-
  move(Node, NextNode),
  \+ member(NextNode, Visited).

goal(Stacks):-
  member([a,b,c], Stacks).

solve_depthfirst_cyclefree(Node, Path):-
  depthfirst_cyclefree([Node], Node, RevPath),
  reverse(RevPath, Path).

depthfirst_cyclefree(Visited, Node, Visited):-
  goal(Node).

depthfirst_cyclefree(Visited, Node, Path):-
  move_cyclefree(Visited, Node, NextNode),
  depthfirst_cyclefree([NextNode|Visited], NextNode, Path).

/** <examples> Your example queries go here, e.g.
?- solve_depthfirst_cyclefree([[c,b,a],[],[]], Plan).
?- solve_depthfirst_cyclefree([[c,a],[b],[]], Plan).
*/
