solution(A,B,C,D,E):-
  color(A), color(B),
  color(C), color(D), color(E),
  \+ A=B, \+ A=C, \+ A=D,
  \+ A=E, \+ B=C, \+ C=D, \+ D=E.

% use three colors
color(red).
color(white).
color(blue).

print_colors:-
  solution(A,B,C,D,E), nl,
  write('Country A is coloured '), write(A), nl,
  write('Country B is coloured '), write(B), nl,
  write('Country C is coloured '), write(C), nl,
  write('Country D is coloured '), write(D), nl,
  write('Country E is coloured '), write(E), nl.

/** <examples> Your example queries go here, e.g.
?- solution(A,B,C,D,E).
?- print_colors.
*/
