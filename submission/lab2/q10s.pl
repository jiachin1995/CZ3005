/*Import modules*/
?- ['sports.pl'].
?- ['counter.pl'].
?- ['selected.pl'].
?- ['help.pl'].

/*Reset function for new game*/
reset :-
    initscoretotal,
    initround,
    init_selection,
    writeln("Resetting 10 Questions \n"),
    writeln("Theme is Sports!"),
    writeln("Each question increases your score by 1."),
    writeln("Each wrong guess increases your score by 1."),
    writeln("Try to get the lowest score! \n").

/*Function to start a new round*/
start:- 
    initcounter,
    initscore,
    incrementround,
    set_select,
    round(R),
    format("Starting round ~a of 5 ~n", [R]),
    writeln("Type 'help.'(no qoutes) to receive help or instructions.").
    

/*function to ask a question*/
has(X) :-
    increment,      /*increment questions counter*/
	counter(V),
	
	/*if questions counter less than 10*/
	V =< 10 -> 			
	
	/*then statement*/
	incrementscore,
    selected(S),
    call(S, L),         /*Evaluates S(L). Get list L of selected sport S..*/
    
	/* if hasitem is true. This is a second if else statement */
	(hasitem(L, X) ->
		format("Selected game does contain ~w", [X]);
		format("Selected game does not contain ~w", [X])
	);
	
	/*else*/
    writeln("10 questions has been asked. no response will be given.").
	

/* function used to make guesses */
is(X) :-
    selected(S),                /* get selected S*/
    X = S ->                    /* check if guess is correct*/
    endround;                   /* if true, start new round */
    writeln("Sorry, that was the wrong guess. Try again!"),
    incrementscore.             /* else, increment score*/
    
    
/*function to end the round*/
endround:-
	/*ending round*/
    writeln('You have guessed correctly! '),
    getscore,
	
	/* if round < 5*/
	round(R),		
	R < 5 ->
	
	/*then statement*/
	
    writeln('Round ended. Starting new round in 3 seconds. \n'),
    sleep(3),
    start;
	
	/*else statement*/
	writeln("Game Complete. Type 'reset.' followed by 'start.' to begin a new game. \n").
    
/*function to check that item is in list*/
hasitem([], _) :-           /*End of recursion. Return false.*/
    false.
hasitem([H|T], X):-         /*If first item is X, return True. Else, recursively calls hasitem. */
    H = X;
    hasitem(T, X).
    
getscore :-
	score(S),
    addscoretotal,
    scoretotal(TS),
    format("Your score is ~a. Your total score is ~a. Try to get the lowest score! ~n~n", [S,TS]).
	

	