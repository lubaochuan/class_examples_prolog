len([],0).
len([_|T],N):-
  len(T,X),
  N is X+1.

accLen([],Acc,Acc).
accLen([_|T],Acc,Length):-
  NextAcc is Acc+1,
  accLen(T,NextAcc,Length).
leng(List,Length):-
  accLen(List,0,Length).

accMax([H|T],A,Max):-
  H  >  A,
  accMax(T,H,Max).

accMax([H|T],A,Max):-
  H  =<  A,
  accMax(T,A,Max).

accMax([],A,A).

max(List,Max):-
  List = [H|_],
  accMax(List,H,Max).

/** <examples> Your example queries go here, e.g.
?- len([a,b,c,d,e,[a,b],g],X).
?- accLen([a,b,c,d,e],0,X).
?- leng([a,b,c,d,e],X).
?- accMax([1,0,5,4],0,Max).
?- accMax([-11,-2,-7,-4,-12],0,Max).
?- max([-11,-2,-7,-4,-12],X).
*/
