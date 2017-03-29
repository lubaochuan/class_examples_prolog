edge(g, h).
edge(g, d).
edge(e, d).
edge(h, f).
edge(e, f).
edge(a, e).
edge(a, b).
edge(b, f).
edge(b, c).
edge(f, c).
edge(d, a).

can_go(X, Y):-
  edge(X, Y).
can_go(X, Y):-
  can_go(Z, Y),
  edge(X, Z).

/** <examples> Your example queries go here, e.g.
?- can_go(a, a).
?- can_go(a, c).
?- can_go(a, g).
*/
