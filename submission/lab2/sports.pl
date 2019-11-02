/* List of sports */
sports([tennis, diving, golf, baseball, soccer, rugby, basketball, ultimate_frisbee, volleyball, badminton, swimming, skiing,
    surfing, archery, karate, bowling, dodgeball, table_tennis, hockey]).


/* Game contents */
tennis([court, outdoor, singles, doubles, ball, racket, scores, knockout]).
diving([pool, indoor, singles, scores, performance]).
golf([field, outdoor, singles, scores, ball, performance, club]).
baseball([field, outdoor, ball, bat, scores, performance ]).
soccer([field, outdoor, ball, scores, timed, maxteamsize(11) ]).
rugby([field, outdoor, ball, scores, timed, maxteamsize(15)]).
basketball([court, indoor, ball, scores, timed]).
ultimate_frisbee([field, outdoor, scores, frisbee, timed]).
volleyball([court, indoor, ball, scores, knockout]).
badminton([court, indoor, singles, doubles, scores, knockout, shuttlecock, racket]).
swimming([pool, indoor, fastest, performance]).
skiing([field, outdoor,skiis, fastest, performance, performance]).
surfing([sea, outdoor,surfboard, scores, performance]).
archery([field, court, indoor, bow_arrow, scores, performance]).
karate([court, indoor, scores, knockout]).
bowling([court, indoor, ball, scores, performance]).
dodgeball([court, indoor, ball, scores, knockout]).
table_tennis([court, singles, doubles, indoor, scores, knockout, ball, racket]). 
hockey([court, indoor, puck, hockeystick, scores, timed]).

/*list of options. Options are items that contains a list as their arity. Used by help.pl. */
options([equipment, scoringtype, gamemode]).


/*options and their lists*/
equipment([ball, puck, racket,frisbee,surfboard,skiis, bow_arrow, shuttlecock, bat, club, hockeystick]).
scoringtype([scores, fastest]).
gamemode([knockout,timed, performance]).