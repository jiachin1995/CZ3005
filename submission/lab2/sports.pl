/* List of sports */
sports([tennis, diving, golf, baseball, soccer, rugby, basketball, ultimate_frisbee, volleyball, badminton, swimming, skiing,
    surfing, archery, karate, bowling, dodgeball, table_tennis, hockey]).


/* Game contents */
tennis([court, outdoor, singles, doubles, ball, racket, scores, knockout, maxteamsize(2)]).
diving([pool, indoor, singles, scores, performance, maxteamsize(1)]).
golf([field, outdoor, singles, outdoor, scores, ball, performance, club, maxteamsize(1)]).
baseball([field, outdoor, outdoor, ball, bat, scores, performance, maxteamsize(9) ]).
soccer([field, outdoor, ball, scores, timed, maxteamsize(11) ]).
rugby([field, outdoor, ball, scores, timed, maxteamsize(15)]).
basketball([court, indoor, ball, scores, timed, maxteamsize(5)]).
ultimate_frisbee([field, outdoor, scores, frisbee, timed, maxteamsize(7)]).
volleyball([court, indoor, ball, scores, knockout, maxteamsize(6)]).
badminton([court, indoor, singles, doubles, scores, knockout, shuttlecock, racket, maxteamsize(2)]).
swimming([pool, indoor, fastest, performance, maxteamsize(1)]).
skiing([field, outdoor,skiis, fastest, performance, performance, maxteamsize(1)]).
surfing([sea, outdoor,surfboard, scores, performance, maxteamsize(1)]).
archery([field, court, indoor, bow_arrow, scores, performance, maxteamsize(1)]).
karate([court, indoor, scores, knockout, maxteamsize(1)]).
bowling([court, indoor, ball, scores, performance, maxteamsize(5)]).
dodgeball([court, indoor, ball, scores, knockout, maxteamsize(6)]).
table_tennis([court, singles, doubles, indoor, scores, knockout, ball, racket, maxteamsize(3)]). 
hockey([court, indoor, puck, hockeystick, scores, timed, maxteamsize(6)]).

/*list of options. Options are items that contains a list as their arity. Used by help.pl. */
options([equipment, scoringtype, gamemode]).


/*options and their lists*/
equipment([ball, puck, racket,frisbee,surfboard,skiis, bow_arrow, shuttlecock, bat, club, hockeystick]).
scoringtype([scores, fastest]).
gamemode([knockout,timed, performance])