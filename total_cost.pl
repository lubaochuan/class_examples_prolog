member(X, [X|_]).
% same as member(X, [Y|_]):- X = Y.

member(X, [_|Y]):-
  member(X, Y).

cost(cornflakes, 230).
cost(cocacola, 210).
cost(chocolate, 250).
cost(crisps, 190).

total_cost([], 0).
total_cost([Item|Rest], Cost):-
  cost(Item, ItemCost),
  total_cost(Rest, CostOfRest),
  Cost is ItemCost + CostOfRest.

/** <examples> Your example queries go here, e.g.
?- X = [1 | [2, 3]].
?- Head = 1 , Tail = [2, 3], List = [Head | Tail].
?- [X, Y, Z] = [1, 2, 3].
?- [X | Y] = [1, 2, 3].
?- [X | Y] = [1].
?- [X, Y | Z] = [fred, jim, jill, mary].
?- member(a, [a,b,c,d]).
?- member(e, [a,b,c,d]).
?- total_cost([cornflakes, crisps], X).
*/
%source: http://www.cse.unsw.edu.au/~billw/cs9414/notes/prolog/intro.html
