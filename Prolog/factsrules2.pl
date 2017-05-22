male(john).
male(tom).
male(tim).

female(anna).
female(liz).
female(sarah).

parent(john, tom).
parent(john, tim).
parent(josh, john).

wife(anna, john).

brother(john, liz).
brother(john, sarah).

family :- 
	male(X),
	write(X).

get_grandparent :-
	parent(X, tom),
	parent(Y, X),
	format('~w ~s grandparent of tom', [Y, "is the"]).

grandparent(X, Y) :-
	parent(Z, Y),
	parent(X, Z),
	write(X).
