move(Stacks, NewStacks):-
  select([Top|Stack1], Stacks, Rest),
  select(Stack2, Rest, OtherStacks),
  NewStacks = [Stack1,[Top|Stack2]|OtherStacks].

move_cyclefree(Visited, Node, NextNode):-
  move(Node, NextNode),
  \+ member(NextNode, Visited).

goal(Stacks):-
  member([a,b,c], Stacks).

solve_breadthfirst(Node, Path):-
  breadthfirst([[Node]], RevPath),
  reverse(RevPath, Path).

breadthfirst([[Node|Path]|_], [Node|Path]):-
  goal(Node).

breadthfirst([Path|Paths], SolutionPath):-
  expand_breadthfirst(Path, ExpPaths),
  append(Paths, ExpPaths, NewPaths),
  breadthfirst(NewPaths, SolutionPath).

expand_breadthfirst([Node|Path], ExpPaths):-
  findall([NewNode,Node|Path],
          move_cyclefree(Path, Node, NewNode),
          ExpPaths).

/** <examples> Your example queries go here, e.g.
?- solve_breadthfirst([[c,a],[b],[]], Plan).
*/
