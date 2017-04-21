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

move(X, Y, 1):-
  legal_move(X,_,Y).

legal_move([0,B,C, X,E,F, G,H,I],up(X),[X,B,C, 0,E,F, G,H,I]).
legal_move([A,0,C, D,X,F, G,H,I],up(X),[A,X,C, D,0,F, G,H,I]).
legal_move([A,B,0, D,E,X, G,H,I],up(X),[A,B,X, D,E,0, G,H,I]).
legal_move([A,B,C, 0,E,F, X,H,I],up(X),[A,B,C, X,E,F, 0,H,I]).
legal_move([A,B,C, D,0,F, G,X,I],up(X),[A,B,C, D,X,F, G,0,I]).
legal_move([A,B,C, D,E,0, G,H,X],up(X),[A,B,C, D,E,X, G,H,0]).
legal_move(S1, down(X), S2):- legal_move(S2, up(X), S1).

legal_move([0,X,C, D,E,F, G,H,I],left(X),[X,0,C, D,E,F, G,H,I]).
legal_move([A,0,X, D,E,F, G,H,I],left(X),[A,X,0, D,E,F, G,H,I]).
legal_move([A,B,C, 0,X,F, G,H,I],left(X),[A,B,C, X,0,F, G,H,I]).
legal_move([A,B,C, D,0,X, G,H,I],left(X),[A,B,C, D,X,0, G,H,I]).
legal_move([A,B,C, D,E,F, 0,X,I],left(X),[A,B,C, D,E,F, X,0,I]).
legal_move([A,B,C, D,E,F, G,0,X],left(X),[A,B,C, D,E,F, G,X,0]).
legal_move(S1, right(X), S2):- legal_move(S2, left(X), S1).

estimate(Node, Estimate):-
  goal(G),
  count_diffs(Node, G, Estimate).

count_diffs(X,X,0):- !.
count_diffs([H|T1],[H|T2],Result):-
  count_diffs(T1,T2,Result).
count_diffs([H1|T1],[H2|T2],Result):-
  H1 \== H2,
  count_diffs(T1,T2,Result1),
  Result is Result1+1.

goal([1,2,3,8,0,4,7,6,5]).

/** <examples> Your example queries go here, e.g.
1 step away:
?- solve_astar([1,2,3,8,6,4,7,0,5], Path).
2 steps away:
?- solve_astar([1,2,3,8,6,4,7,5,0], Path).
3 steps away:
?- solve_astar([1,2,3,8,6,0,7,5,4], Path).
4 steps away:
?- solve_astar([1,2,0,8,6,3,7,5,4], Path).
5 steps away:
?- solve_astar([1,0,2,8,6,3,7,5,4], Path).
6 steps away:
?- solve_astar([0,1,2,8,6,3,7,5,4], Path).
7 steps away:
?- solve_astar([8,1,2,0,6,3,7,5,4], Path).
?- solve_astar([1,2,6,7,0,3,5,8,4], Path).
*/
