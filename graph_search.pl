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

path(Node, Node, _, [Node]).
path(Start, Finish, Visited, [Start | Path]):-
  edge(Start, X),
  \+ member(X, Visited),
  path(X, Finish, [X | Visited], Path).

/** <examples> Your example queries go here, e.g.
?- path(a, g, [a], Path).
?- path(a, f, [a], Path).
*/
