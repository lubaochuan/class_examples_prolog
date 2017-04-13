addone([],[]).
addone([H1|T1],[H2|T2]):-
  H2 is H1*2,
  addone(T1,T2).

/** <examples> Your example queries go here, e.g.
?- addone([1,2,7,2],X).
*/
