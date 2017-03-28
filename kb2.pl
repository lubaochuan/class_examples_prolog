happy(yolanda).
listens2Music(mia).
listens2Music(yolanda):-
  happy(yolanda).
playsAirGuitar(mia):-
  listens2Music(mia).
playsAirGuitar(yolanda):-
  listens2Music(yolanda).

/** <examples> Your example queries go here, e.g.
?- playsAirGuitar(mia).
?- playsAirGuitar(yolanda).
?- listing.
*/
