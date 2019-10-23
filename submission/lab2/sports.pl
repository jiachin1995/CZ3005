/* List of sports */
sports([tennis, diving, golf, baseball, soccer, rugby, basketball, ultimate_frisbee, volleyball, badminton, swimming, skiing,
    surfing, archery, karate, bowling, dodgeball, table_tennis]).


/* Game contents */
tennis([court, outdoor, singles, doubles, ball, racket, maxteamsize(2)]).
diving([pool, indoor, singles, maxteamsize(1)]).
golf([field, outdoor, singles, outdoor, ball, club, maxteamsize(1)]).
baseball([field, outdoor, outdoor, ball, bat, maxteamsize(9) ]).
soccer([field, outdoor, ball, maxteamsize(11) ]).
rugby([field, outdoor, ball, maxteamsize(15)]).
basketball([court, indoor, ball, maxteamsize(5)]).
ultimate_frisbee([field, outdoor, frisbee, maxteamsize(7)]).
volleyball([court, indoor, ball, maxteamsize(6)]).
badminton([court, indoor, singles, doubles, shuttlecock, racket, maxteamsize(2)]).
swimming([pool, indoor, maxteamsize(1)]).
skiing([field, outdoor,skiis, maxteamsize(1)]).
surfing([sea, outdoor,surfboard, maxteamsize(1)]).
archery([field, court, indoor, bow_arrow, maxteamsize(1)]).
karate([court, indoor, maxteamsize(1)]).
bowling([court, indoor, ball, maxteamsize(5)]).
dodgeball([court, indoor, ball, maxteamsize(6)]).
table_tennis([court, singles, doubles, indoor, ball, racket, maxteamsize(3)]). 

/*list of options. Options are items that contains a list as their arity. Used by help.pl. */
options([equipment]).


/*equipment*/
equipment([ball, racket,frisbee,surfboard,skiis, bow_arrow, shuttlecock, bat, club]).
