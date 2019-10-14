?- ['games.pl'].
?- ['counter.pl'].
?- ['selected.pl'].
?- ['help.pl'].

reset :-
    initcounter,
    initscore,
    initround,
    init_selection,
    writeln("Resetting 10 Questions \n"),
    writeln("Theme is Sports!"),
    writeln("Each question increases your score by 1."),
    writeln("Each wrong guess increases your score by 1."),
    writeln("Try to get the lowest score! \n").

start:- 
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
is(X) :-
    selected(S),
    X = S.
    /*start new round if true else increment score*/
    
    