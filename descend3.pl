% child(X,Y): Y is a child of X
child(anne,bridget).
child(bridget,caroline).
child(caroline,donna).
child(donna,emily).

descend(X,Y):-
  descend(Z,Y),
  child(X,Z).

descend(X,Y):-
  child(X,Y).

/** <examples> Your example queries go here, e.g.
?- descend(anne,emily).
*/
