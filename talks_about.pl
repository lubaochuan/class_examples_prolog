talks_about(A,B):-
  knows(A,B).

talks_about(P,R):-
  knows(P,Q),
  talks_about(Q,R).

knows(bill,jane).
knows(jane,pat).
knows(jane,fred).
knows(fred,bill).

/*
knows(X,Y):-
  knows(Y,X).
*/
/** <examples> Your example queries go here, e.g.
?- talks_about(bill,pat).
?- talks_about(pat,bill).
?- talks_about(bill,bill).
*/
