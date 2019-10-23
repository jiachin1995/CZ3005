/*counter function. Keeps track of number of questions, has(), asked. */
:- dynamic counter/1.       /* Dynamic means that procedure is not fixed*/

/* function to initialise counter as 0. we retract all previous instances of counter and assert new counter */
initcounter :-
    retractall(counter(_)),     /* Forget all previous declartions of counter */
    assertz(counter(1)).        /* Initialise counter as 1*/

/*function to increment counter*/
increment :-
    counter(V0),                /*Get current counter*/
    retractall(counter(_)),     /* Forget all previous declartions of counter */
    succ(V0, V),                /*increment V0 to V*/
    assertz(counter(V)).        /*Set counter as V*/

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

/*same as counter. But used for total scoring*/
:- dynamic scoretotal/1.   

initscoretotal :-
    retractall(scoretotal(_)),
    assertz(scoretotal(0)).

addscoretotal :-
    score(V0),
    scoretotal(V1),
    V is V0+V1,
    retractall(scoretotal(_)), 
    assertz(scoretotal(V)).
    
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