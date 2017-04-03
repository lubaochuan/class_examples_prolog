% http://www.learnprolognow.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse5
% You can write useful programs simply by using complex terms to define
% interesting concepts. Unification can then be used to pull out the
% information you want.

vertical(line(point(X,Y),point(X,Z))).
horizontal(line(point(X,Y),point(Z,Y))).

/** <examples> Your example queries go here, e.g.
?- vertical(line(point(1,1),point(1,3))).
?- vertical(line(point(1,1),point(3,2))).
?- horizontal(line(point(1,1),point(2,Y))).
?- horizontal(line(point(2,3),P)).
*/
