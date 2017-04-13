% source: https://www.metalevel.at/tist/
list1_element_list2([], _, []).
list1_element_list2([E|Ls1], E, Ls2) :-
  list1_element_list2(Ls1, E, Ls2).
list1_element_list2([L|Ls1], E, [L|Ls2]) :-
  dif(L, E),
  list1_element_list2(Ls1, E, Ls2).

/** <examples> Your example queries go here, e.g.
What does a list look like if we remove all occurrences of the element E?
?- list1_element_list2([1,2,7,2], 2, X).
Which element, if any, has been removed in a given example?
?- list1_element_list2([1,2,7,2], X, [1,7]).
?- list1_element_list2([1,2,7,2], X, [1,2,7,2]).
For which 3 entities does this relation even hold?
?- list1_element_list2(List1, E, List2).
*/
