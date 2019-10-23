/* Declarations*/
offsprings([charles, ann, andrew , edward]). /* Declared according to order of birth*/
male(charles). 
male(andrew).
male(edward).
female(ann).

/*sort function for old succession*/
mysort([], [], []).
mysort([H|T], MS, FS):-
    mysort(T, MS0, FS),
	male(H),
    append([H], MS0, MS);
    mysort(T, MS, FS0),
    female(H),
    append([H], FS0, FS).


/*Main Sucession call function*/
succession(X) :-
    offsprings(L),
    mysort(L, M, F),
    append(M, F, X).

/*Main new succession call function*/
new_succession(X) :-
offsprings(X). 
