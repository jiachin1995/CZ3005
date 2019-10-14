/*counter function */

/* declare counter. dynamic means that procedure is not fixed*/
:- dynamic counter/1.   

/* function to initialise counter as 0. we retract all previous instances of counter and assert new counter */
initcounter :-
    retractall(counter(_)),
    assertz(counter(1)).

/*function to increment counter*/
increment :-
    counter(V0),
    retractall(counter(_)),
    succ(V0, V),
    assertz(counter(V)).

/*same as counter. But used for scoring*/
:- dynamic score/1.   

initscore :-
    retractall(score(_)),
    assertz(score(0)).

incrementscore :-
    score(V0),
    retractall(score(_)), 
    succ(V0, V),
    assertz(score(V)).
    
/*same as counter. But used for rounds*/
:- dynamic round/1.   

initround :-
    retractall(round(_)),
    assertz(round(0)).

incrementround :-
    round(V0),
    retractall(round(_)), 
    succ(V0, V),
    assertz(round(V)).