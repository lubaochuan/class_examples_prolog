% we can generalize the solution to path finding
% in a directed graph (may have cycles).
edge(g,h).
edge(g,d).
edge(e,d).
edge(h,f).
edge(e,f).
edge(a,e).
edge(a,b).
edge(b,f).
edge(b,c).
edge(f,c).
edge(d,a).

can_go(X,X,Visited,Route):-
  reverse(Visited,Route).

can_go(X,Y,Visited,Route):-
  edge(X,Z),
  \+ member(Z,Visited),
  can_go(Z,Y,[Z|Visited],Route).

route(X,Y,Route):-
  can_go(X,Y,[X],Route).

/** <examples> Your example queries go here, e.g.
?- route(a,c,Route).
?- route(e,c,Route).
*/
