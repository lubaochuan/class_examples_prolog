happy(vincent).
listens2Music(butch).
playsAirGuitar(vincent):-
  listens2Music(vincent),
  happy(vincent).
playsAirGuitar(butch):-
  happy(butch).
playsAirGuitar(butch):-
  listens2Music(butch).

/** <examples> Your example queries go here, e.g.
?- playsAirGuitar(vincent).
?- playsAirGuitar(butch).
?- listing.
*/
