% the visted list is the route in reverse order.

directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

travelFromTo(X,X,Visited,Route):-
  reverse(Visited,Route).

travelFromTo(X,Y,Visited,Route):-
  ( directTrain(X,Z); directTrain(Z,X) ),
  \+ member(Z,Visited),
  travelFromTo(Z,Y,[Z|Visited],Route).

route(X,Y,Route):-
  travelFromTo(X,Y,[X],Route).

/** <examples> Your example queries go here, e.g.
?- route(nancy,saarbruecken,Route).
?- route(forbach,metz,Route).
*/
