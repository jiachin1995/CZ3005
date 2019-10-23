/* Declarations*/
appyCompetitor(sumsum).
ownerof(sumsum, gal-s3).
smartphonetech(gal-s3).
stole(stevey, gal-s3).
boss(stevey).
business(smartphonetech).

/* functions */

rival(X) :- appyCompetitor(X).

ethical(X):-
    boss(X),
    ownerof(Owner, Business),
    rival(Owner),
    \+ stole(X, Business).