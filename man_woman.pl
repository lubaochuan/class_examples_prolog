man(fred).
man(jim).

woman(jean).
woman(jane).
woman(joan).
woman(pat).

woman(X):-
  \+ man(X).

/** <examples> Your example queries go here, e.g.
?- woman(jim).
?- woman(alice).
?- woman(X).
?- man(tom).
*/
