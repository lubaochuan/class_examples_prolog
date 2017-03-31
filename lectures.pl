% lectures(X, Y): person X lectures in course Y
lectures(turing, 9020).
lectures(codd, 9311).
lectures(backus, 9021).
lectures(ritchie, 9201).
lectures(minsky, 9414).
lectures(codd, 9314).

% studies(X, Y): person X studies in course Y
studies(fred, 9020).
studies(jack, 9311).
studies(jill, 9314).
studies(jill, 9414).
studies(henry, 9414).
studies(henry, 9314).

% year(X, Y): person X is in year Y
year(fred, 1).
year(jack, 2).
year(jill, 2).
year(henry, 4).

more_advanced(S1, S2):-
  year(S1, Year1),
  year(S2, Year2),
  Year1 > Year2.

/** <examples> Your example queries go here, e.g.
?- lectures(turing, 9020).
?- lectures(codd, 9020).
?- lectures(turing, Course).
?- lectures(codd , Course).
?- lectures(turing, Course), studies(fred, Course).
?- lectures(codd, Course), studies(Student, Course).
?- more_advanced(henry, fred).
*/
% source: http://www.cse.unsw.edu.au/~billw/cs9414/notes/prolog/intro.html
