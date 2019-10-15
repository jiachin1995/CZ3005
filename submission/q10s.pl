?- ['sports.pl'].
?- ['counter.pl'].
?- ['selected.pl'].
?- ['help.pl'].

reset :-
    initscoretotal,
    initround,
    init_selection,
    writeln("Resetting 10 Questions \n"),
    writeln("Theme is Sports!"),
    writeln("Each question increases your score by 1."),
    writeln("Each wrong guess increases your score by 1."),
    writeln("Try to get the lowest score! \n").

start:- 
    initcounter,
    initscore,
    incrementround,
    set_select,
    round(R),
    format("Starting round ~a of 5 ~n", [R]),
    writeln("Type 'help.'(no qoutes) to receive help or instructions.").
    

    
/*
has(X) :-
    check that X is in selected.list
    return true or false
    
has(X, N) :-
    check that X has integer N in selected.list
    return true or false.
    eg. has(teamsize,8)
   
*/   
/* function used to make guesses */
is(X) :-
    selected(S),                /* get selected S*/
    X = S ->                    /* check if guess is correct*/
    endround;                   /* if true, start new round */
    writeln("Sorry, that was the wrong guess. Try again!"),
    incrementscore.             /* else, increment score*/
    
    
/*function to end the round*/
endround:-
    writeln('You have guessed correctly! '),
    score(S),
    addscoretotal,
    scoretotal(TS),
    format("Your score is ~a. Your total score is ~a. Try to get the lowest score! ~n~n", [S,TS]),
    writeln('Round ended. Starting new round in 3 seconds. \n'),
    sleep(3),
    start.