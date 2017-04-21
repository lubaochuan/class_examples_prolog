plan(L):-
  initial_state(I),
  goal_state(G),
  reachable(I,L,G).

reachable(S,[],S).

reachable(S1,[M|L],S3):-
  legal_move(S1,M,S2),
  reachable(S2,L,S3).

initial_state([h,h,t]).
goal_state([h,h,h]).
goal_state([t,t,t]).

legal_move([X,Y,Z],flip_left,[X1,Y,Z]):-
  opposite(X,X1).

legal_move([X,Y,Z],flip_middle,[X,Y1,Z]):-
  opposite(Y,Y1).

legal_move([X,Y,Z],flip_right,[X,Y,Z1]):-
  opposite(Z,Z1).

opposite(h,t).
opposite(t,h).
/** <examples> Your example queries go here, e.g.
?- plan([M1,M2,M3]).
?- plan([M1]).
*/
