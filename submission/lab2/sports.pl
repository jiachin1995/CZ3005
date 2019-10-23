/* List of sports */
sports([tennis, diving, golf, baseball, soccer, rugby, basketball, ultimate_frisbee, volleyball, badminton, swimming, skiing,
    surfing, archery, karate, bowling, dodgeball, table_tennis]).


/* Game contents */
tennis([court, outdoor, singles, doubles, ball, racket, scores, maxteamsize(2)]).
diving([pool, indoor, singles, scores, maxteamsize(1)]).
golf([field, outdoor, singles, outdoor, scores, ball, club, maxteamsize(1)]).
baseball([field, outdoor, outdoor, ball, bat, scores, maxteamsize(9) ]).
soccer([field, outdoor, ball, scores, maxteamsize(11) ]).
rugby([field, outdoor, ball, scores, maxteamsize(15)]).
basketball([court, indoor, ball, scores, maxteamsize(5)]).
ultimate_frisbee([field, outdoor, scores, frisbee, maxteamsize(7)]).
volleyball([court, indoor, ball, scores, maxteamsize(6)]).
badminton([court, indoor, singles, doubles, scores, shuttlecock, racket, maxteamsize(2)]).
swimming([pool, indoor, fastest, maxteamsize(1)]).
skiing([field, outdoor,skiis, fastest, maxteamsize(1)]).
surfing([sea, outdoor,surfboard, scores, maxteamsize(1)]).
archery([field, court, indoor, bow_arrow, scores, maxteamsize(1)]).
karate([court, indoor, scores, maxteamsize(1)]).
bowling([court, indoor, ball, scores, maxteamsize(5)]).
dodgeball([court, indoor, ball, scores, maxteamsize(6)]).
table_tennis([court, singles, doubles, indoor, scores, ball, racket, maxteamsize(3)]). 

/*list of options. Options are items that contains a list as their arity. Used by help.pl. */
options([equipment, performancetype]).


/*options and their lists*/
equipment([ball, racket,frisbee,surfboard,skiis, bow_arrow, shuttlecock, bat, club]).
performancetype([scores, fastest]).