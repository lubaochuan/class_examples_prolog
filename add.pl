add(0,Y,Y).
add(succ(X),Y,succ(Z)):-
  add(X,Y,Z).

/** <examples> Your example queries go here, e.g.
?- add(succ(succ(0)),succ(succ(0)),succ(succ(succ(succ(0))))).
?- add(0,0,Y).
?- add(0,succ(succ(0)),Y).
?- add(succ(succ(succ(0))), succ(succ(0)), R).
*/
