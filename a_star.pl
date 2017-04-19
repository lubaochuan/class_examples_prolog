% http://www.cs.ubbcluj.ro/~csatol/log_funk/prolog/slides/7-search.pdf

solve_astar(Node, Path/Cost):-
  estimate(Node, Estimate),
  astar([[Node]/0/Estimate], RevPath/Cost/_),
  reverse(RevPath, Path).

move_astar([Node|Path]/Cost/_, [NextNode,Node|Path]/NewCost/Est):-
  move(Node, NextNode, StepCost),
  \+ member(NextNode, Path),
  NewCost is Cost + StepCost,
  estimate(NextNode, Est).

% http://www.swi-prolog.org/pldoc/man?predicate=findall/3
expand_astar(Path, ExpPaths):-
  findall(NewPath, move_astar(Path,NewPath), ExpPaths).

get_best([Path], Path):- !.

get_best([Path1/Cost1/Est1,_/Cost2/Est2|Paths], BestPath):-
  Cost1 + Est1 =< Cost2 + Est2, !,
  get_best([Path1/Cost1/Est1|Paths], BestPath).

get_best([_|Paths], BestPath):-
  get_best(Paths, BestPath).

astar(Paths, Path):-
  get_best(Paths, Path),
  Path = [Node|_]/_/_,
  goal(Node).

astar(Paths, SolutionPath) :-
  get_best(Paths, BestPath),
  select(BestPath, Paths, OtherPaths),
  expand_astar(BestPath, ExpPaths),
  append(OtherPaths, ExpPaths, NewPaths),
  astar(NewPaths, SolutionPath).

move(s, a, 2). estimate(a, 5).
move(a, b, 2). estimate(b, 4).
move(b, c, 2). estimate(c, 4).
move(c, d, 3). estimate(d, 3).
move(d, t, 3). estimate(t, 0).
move(s, e, 2). estimate(e, 7).
move(e, f, 5). estimate(f, 4).
move(f, g, 2). estimate(g, 2).
move(g, t, 2).
estimate(s, 1000).
goal(t).

/** <examples> Your example queries go here, e.g.
?- solve_astar(s, Path).
*/
