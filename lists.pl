% print a list with a single space between elements
print_a_list([]).
print_a_list([H|T]):-
  write(H),
  write(' '),
  print_a_list(T).

% print every other element in a list
print_every_second([]).
print_every_second([_|T]):-
  T=[].
print_every_second(L):-
  [_|T1]=L,
  [H2|T2]=T1,
  write(H2),
  print_every_second(T2).

deconsonant([]).
deconsonant(L):-
  [H|T]=L,
  is_vowel(H),
  write(H),
  deconsonant(T).
is_vowel(C):-
  member(C,[a,o,e,i,u]).

% return the head of a list as the 2nd argument
head(L,H):-
  [H|_]=L.

% successor(+,-) returns the next largest interger > X
successor(X,Y):-
  Y is X+1.

% test a list has at least one term that is a list
nested_list([Head|_]):-
  sublist(Head).
nested_list([_|Tail]):-
  nested_list(Tail).
sublist([]).
sublist([_|_]).

member(Element,[Element|_]).
member(Element,[_|Tail]):-
  member(Element,Tail).

all_digits([]).
all_digits([Head|Tail]):-
  member(Head, [0,1,2,3,4,5,6,7,8,9]),
  all_digits(Tail).

% triple each element in a list
triple([],[]).
triple([H1|T1],[H2|T2]):-
  H2 is H1*3,
  triple(T1,T2).

% implement triple/2 with an accumulator
triple1([],Y,Y).
triple1([H1|T1],A,Y):-
  H2 is H1*3,
  triple1(T1,[H2|A],Y).

% implementation with finite generator
integer_with_two_digit_square(X):-
  int(X),
  test_square(X).
test_square(X):-
  Y is X*X,
  Y >= 10,
  Y < 100.
int(1).
int(2).
int(3).
int(4).
int(5).

% reimplementation with infinite generator
integer_with_two_digit_square1(X):-
  int1(X),
  test_square(X),!.
int1(1).
int1(N):-
  int1(N1),
  %write(N1),
  %write(' '),
  N is N1+1.

memberchk1(Element,[Head|_]):-
  Element = Head.
memberchk1(Element,[Head|Tail]):-
  \+(Element = Head),
  memberchk1(Element,Tail).

/** <examples> Your example queries go here, e.g.
?- print_a_list([1,2,3]).
?- print_every_second([1,2,3,4,5,6,7]).
?- deconsonant([p,r,o,l,o,g]).
?- deconsonant([p,r,o,l,o,g]).
?- head([1,2,3],H).
?- successor(2,Y).
?- nested_list([1,2,3]).
?- nested_list([1,[2],3]).
?- nested_list([a,[b],c,[],[d],e]),write(y),fail.
?- member(c,[a,b,c]).
?- member(d,[a,b,c]).
?- member(a,[]).
?- all_digits([1,2,3]).
?- all_digits([1,a,3]).
?- triple([1,2,3],Result).
?- triple1([1,2,3],[],X).
?- integer_with_two_digit_square(4).
?- integer_with_two_digit_square(6).
?- integer_with_two_digit_square1(6).
?- memberchk1(2,[1,2,3]).
?- memberchk1(X,[1,2,3]).
?- member(X,[1,2,3]).
*/
