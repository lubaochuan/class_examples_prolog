loves(vincent,mia).
loves(marsellus,mia).
loves(pumpkin,honey_bunny).
loves(honey_bunny,pumpkin).

jealous(X,Y):-
  loves(X,Z),
  loves(Y,Z).

/** <examples> Your example queries go here, e.g.
?- jealous(marsellus,W).
?- jealous(X,Y).
?- listing.
*/
