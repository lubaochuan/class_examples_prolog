% wriet a2b/2 that takes two lists as arguments, and succeeds
% if the first argument is a list of a s, and the second argument
% is a list of b s of exactly the same length.
/*
a2b(X,Y):-
 X=[],
 Y=[].
a2b([H1|T1],[H2|T2]):-
 H1 = a,
 H2 = b,
 a2b(T1,T2).
*/

a2b([],[]).
a2b([a|Ta],[b|Tb]):- a2b(Ta,Tb).

/** <examples> Your example queries go here, e.g.
?- a2b([a,a,a,a],[b,b,b,b]).
?- a2b([a,a,a,a],[b,b,b]).
?- a2b([a,c,a,a],[b,b,5,4]).
?- a2b([a,a,a,a],X).
?- a2b(X,[b,b,b,b]).
?- a2b(X,Y).
*/
