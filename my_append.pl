my_append(X,[],X).
my_append([],Y,Y).
my_append([H|T],Y,[H|New]):-
  my_append(T,Y,New).

/** <examples> Your example queries go here, e.g.
?- my_append([a],[b],Y).
?- my_append(X,[b],[a,b]).
?- my_append([a],X,[a,b]).
?- my_append([a],[],Y).
?- my_append(X,Y,[a,b]).
*/
