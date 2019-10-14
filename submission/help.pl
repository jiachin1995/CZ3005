/* The purpose of this file is to implement print options for help*/

help:-
    writeln("Type the following commands for options: \n"),
    writeln("listgames"),
    writeln("getscore"),
    writeln("has(X)"),
    writeln("is(X)").
    
/*This helper function lists all elements in a set. E.g. list(equipment)*/
list(X):-
    call(X, L),         /*Expects X as a functor. Evaluates X(L). Expects L to be a list.*/
    myprint(L).
    
/*This function prints all elements of a list*/
myprintlist([]):- writeln("").                      /*if list is empty, print newline*/
myprintlist([H|T]):-
    format('~|~a~t~20+', [H]),                  /*print first element of list, formatted to fill 20 spaces*/
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