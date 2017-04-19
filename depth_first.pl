move(Stacks, NewStacks):-
  select([Top|Stack1], Stacks, Rest),
  select(Stack2, Rest, OtherStacks),
  NewStacks = [Stack1,[Top|Stack2]|OtherStacks].

goal(Stacks):-
  member([a,b,c], Stacks).

solve_depthfirst(Node, [Node|Path]):-
  depthfirst(Node, Path).

depthfirst(Node, []):-
  goal(Node).

depthfirst(Node, [NextNode|Path]):-
  move(Node, NextNode),
  depthfirst(NextNode, Path).

/** <examples> Your example queries go here, e.g.
?- solve_depthfirst([[c,b,a],[],[]], Plan).
?- solve_depthfirst([[c,a],[b],[]], Plan).
*/
