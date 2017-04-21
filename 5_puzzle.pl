% This is a 2x3 version of the 15 puzzle.              %%%%%%%%%
initial_state([0,1,5,4,3,2]). %----------------------> %   1 5 %
goal_state([1,2,3,4,5,0]).                             % 4 3 2 %
legal_move([0,B,C, X,E,F],up(X),[X,B,C, 0,E,F]).       %%%%%%%%%
legal_move([A,0,C, D,X,F],up(X),[A,X,C, D,0,F]).
legal_move([A,B,0, D,E,X],up(X),[A,B,X, D,E,0]).
legal_move(S1,down(X),S2):- legal_move(S2,up(X),S1).
legal_move([0,X,C, D,E,F],left(X),[X,0,C, D,E,F]).
legal_move([A,0,X, D,E,F],left(X),[A,X,0, D,E,F]).
legal_move([A,B,C, 0,X,F],left(X),[A,B,C, X,0,F]).
legal_move([A,B,C, D,0,X],left(X),[A,B,C, D,X,0]).
legal_move(S1,right(X),S2):- legal_move(S2,left(X),S1).

% This looks for plans, short ones first, using the plan predicate.
% bplan(L) holds if L is a plan.
bplan(L) :- tryplan([],L).
% tryplan(X,L): L is a plan and has X as its final elements.
tryplan(L,L) :- plan(L).
tryplan(X,L) :- tryplan([_|X],L).

% This general planner needs the predicates below to be defined:
% - legal_move(BeforeState,Move,AfterState)
% - initial_state(State)
% - goal_state(State)
% plan(L): L is a list of moves from the initial state to a goal state.
plan(L):-
  initial_state(I),
  goal_state(G),
  reachable(I,L,G).
% reachable(S1,L,S2): S2 is reachable from S1 using moves L.
reachable(S,[],S).
reachable(S1,[M|L],S3):-
  legal_move(S1,M,S2),
  reachable(S2,L,S3).

/** <examples> Your example queries go here, e.g.
?- bplan(L).
*/
