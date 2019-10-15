/* List of sports */
sports([tennis, diving]).
/* temporarily remove rest of options for debugging

sports([tennis, diving, golf, baseball, soccer, rugby, basketball, ultimate_frisbee, volleyball, badminton, swimming, canoeing, skiing,
surfing, archery, karate, bowling, dodgeball, table_tennis]).
*/

/* Game contents */
tennis([court, singles, doubles, outdoor, ball, racket, maxteamsize(2)]).
diving([pool, singles, jump]).

golf([field, singles, outdoor, ball, club]).
baseball.
soccer.
rugby.
basketball.
ultimate_frisbee.
volleyball.
badminton.
swimming.
canoeing.
skiing.
surfing.
archery.
karate.
bowling.
dodgeball.
table_tennis.

/*list of options. Options are items that contains a list as their arity*/
options([equipment]).


/*equipment*/
equipment([ball, racket]).
