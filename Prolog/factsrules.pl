loves(romeo, juliet).
loves(juliet, romeo) :- loves(romeo, juliet).

friends(romeo, laimonas).
friends(romeo, greta).

male(romeo).
male(laimonas).

female(juliet).
female(greta).

happy(romeo) :- male(romeo), loves(juliet, romeo).

% example of AND operator
is_romeo_happy :- happy(romeo), write('Romeo is happy when he is a male and juliet loves him.').

% example of OR operator
dances(juliet) :- dancer(juliet).
dances(juliet) :- loves(romeo, juliet).


stabs(tybalt, mercutio, sword).
hates(romeo, X) :- stabs(X, mercutio, sword).



