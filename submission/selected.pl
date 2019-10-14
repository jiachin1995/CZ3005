/* declare selection. dynamic means that procedure is not fixed*/
:- dynamic selection/1.  
:- dynamic selected/1.  

/* function to initialise selection. Each selection is a list of sports in random order. We retract all previous instances and assert new selection */
init_selection :-
    retractall(selection(_)),
    sports(L0),
    random_permutation(L0,L),
    assertz(selection(L)).

/*function to get this round's selected*/
set_select :-
    selection(L),
    round(R),
    nth1(R, L, S),                /*Returns element S at index R in list L. nth1 reads index starting from 1*/
    retractall(selected(_)),
    assertz(selected(S)).
    
