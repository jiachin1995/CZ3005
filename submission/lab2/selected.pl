/* declare selection. dynamic means that procedure is not fixed*/
:- dynamic selection/1.  
:- dynamic selected/1.  

/* function to initialise selection. Each selection is a list of sports in random order. We retract all previous instances and assert new selection */
init_selection :-
    retractall(selection(_)),       /*remove all previous selection declaration*/
    sports(L0),                     /*get list of sports*/
    random_permutation(L0,L),        /*shuffle list of sports*/
    assertz(selection(L)).           /*set list of sports as selection*/

/*function to get this round's selected*/
set_select :-
    selection(L),                       /*get list of sports*/
    round(R),                           /*get round number*/
    nth1(R, L, S),                      /*Returns element S at index R in list L. nth1 reads index starting from 1. In other words, if round 2, get element 2*/
    retractall(selected(_)),            /*remove all previous selected*/
    assertz(selected(S)).               /*set new selection*/
    
