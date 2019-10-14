?- ['games.pl'].
?- ['counter.pl'].
?- ['selected.pl'].

reset :-
    initcounter,
    initscore,
    initround,
    init_selection,
    writeln("Resetting 10 Questions"),
    writeln("Theme is Sports!"),
    writeln("Each question increases your score by 1. Each wrong guess increases your score by 1."),
    writeln("Try to get the lowest score!").

start:- 
    incrementround,
    set_select,
    round(R),
    format("Starting round ~a~n", [R]).
    
/*
has(X) :-
    check that X is in selected.list
    return true or false
    
has(X, N) :-
    check that X has integer N in selected.list
    return true or false
    
is(X) :-
    check that X is selected
    
    */