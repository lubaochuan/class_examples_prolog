bad_dog(fido).
bad_dog(Dog):-
  bites(Dog, Person),
  is_person(Person),
  is_dog(Dog).

bites(fido, postman).
is_person(postman).
is_dog(fido).

/** <examples> Your example queries go here, e.g.
?- bad_dog(fido).
*/
%source: http://www.cse.unsw.edu.au/~billw/cs9414/notes/prolog/intro.html
