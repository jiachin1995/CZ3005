/* The purpose of this file is to implement print options for help. 
    This module is necessary as not all sports are implemented and there may be different interpretation according to the developer.
    As such, it is necessary to list all sports and all the sports contents themselves.
    */

help:-
    writeln("Type the following commands for options: \n"),
    writeln("list(sports).  - Prints a list of all sports"),
    writeln("                 This is a tree of depth 2. You can call list() on items of depth 1. E.g. list(tennis)."),
    writeln("list(options). - Prints a list of all options. "),
    writeln("                 This is a tree of depth 2. You can call list() on items of depth 1. E.g. list(equipment)."),
	writeln("special. - Prints a list of special commands. E.g. has(maxteamsize(2))"),
    writeln("                 This is a tree of depth 2. You can call list() on items of depth 1. E.g. list(equipment)."),
	writeln("getscore.		- Prints your score."),
    writeln("has(X).		- Ask if selected game has X. Replies Yes or No. "),
    writeln("is(X).			- Guess the selected game. ").
    
/*This helper function lists all elements in a set. E.g. list(equipment)*/
list(X):-
    call(X, L),         /*Expects X as a functor. Evaluates X(L). Expects L to be a list.*/
    myprint(L).
    
/*This function prints all elements of a list*/
myprintlist([]):- writeln("").                      /*if list is empty, print newline*/
myprintlist([H|T]):-
    format('~|~w~t~20+', [H]),                  /*print first element of list, formatted to fill 20 spaces*/
    myprintlist(T).                                 /*recursively calls rest of list*/
    
/*This function splits a list into 2. Trim is of N length and Tail is the remainder of list. We will use this for formatting print.*/
selectn([], _, [], []).                     /*End recursion if list is empty*/
selectn(L, 0, [],L).                        /*End recursion if N is 0*/
selectn([A|T0], N, Trim, Tail):-
    append([A], T, Trim),                   /*concatenate 2 lists([A] and T) into one list(Trim)*/
    M is N-1,
    selectn(T0, M, T, R),
    append([], R, Tail).
    
    
/*This function formats and prints all elements of a list. */
myprint([]).           /*End recursion if list is empty*/
myprint(L):-
    selectn(L,4,Trim,Tail),
    myprintlist(Trim),
    myprint(Tail).
	
/* Special commands that does not fit in other options*/
special:-
	writeln("You can type has(maxteamsize(2)) to ask if the game has a max team size of 2.").