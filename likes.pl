likes(ann,X):-
  toy(X),
  plays(ann,X).

likes(sue,X):-
  likes(ann,X).

toy(doll).
toy(snoopy).
plays(ann,snoopy).

/** <examples> Your example queries go here, e.g.
?- likes(sue,X).
*/
