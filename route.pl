directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

route(X,Y,Route):-
  can_go(X,Y,[],R),
  reverse(R,Route).

can_go(X,X,T,[X|T]).

can_go(X,Y,T,R):-
  ( directTrain(X,Z); directTrain(Z,X) ),
  \+ member(Z,T),
  can_go(Z,Y,[X|T],R).

/** <examples> Your example queries go here, e.g.
?- route(nancy,saarbruecken,Route).
?- route(forbach,metz,Route).
*/
