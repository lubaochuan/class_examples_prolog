% sources:
% http://www.learnprolognow.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse13
% http://www.cse.unsw.edu.au/~billw/cs9414/notes/prolog/intro.html

% my_member(X, [X|_]).
my_member(X, [Y|_]):-
  X = Y.

my_member(X, [_|Y]):-
  my_member(X, Y).

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
?- [Head|Tail] = [mia,vincent,jules,yolanda].
?- [X|Y] = [].
?- [X|Y] = [[],dead(z),[2,[b,c]],[],Z].
?- [X,Y|W] = [[],dead(z),[2,[b,c]],[],Z].
?- [_,X,_,Y|_] = [[],dead(z),[2,[b,c]],[],Z].
?- X = [1 | [2, 3]].
?- Head = 1 , Tail = [2, 3], List = [Head | Tail].
?- [X, Y, Z] = [1, 2, 3].
?- [X | Y] = [1, 2, 3].
?- [X | Y] = [1].
?- [X, Y | Z] = [fred, jim, jill, mary].
?- my_member(a, [a,b,c,d]).
?- my_member(e, [a,b,c,d]).
?- total_cost([cornflakes, crisps], X).
*/
