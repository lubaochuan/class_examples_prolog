% to solve the problem in route.md and avoid cycles
% we must remember the towns we have visted.

directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).
directTrain(nowhere1,nowwhere2).

travelFromTo(X,Y):-
  can_go(X,Y,[X]).

can_go(X,X,_).

can_go(X,Y,Visited):-
  ( directTrain(X,Z); directTrain(Z,X) ),
  \+ member(Z,Visited),
  can_go(Z,Y,[Z|Visited]).

/** <examples> Your example queries go here, e.g.
?- travelFromTo(nancy,saarbruecken).
?- travelFromTo(forbach,metz).
?- travelFromTo(forbach,nowhere1).
*/
