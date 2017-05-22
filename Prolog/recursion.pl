parent(john, tom).
parent(john, tim).
parent(john, bill).

parent(josh, john).
parent(alice, john).

related(X, Y) :-
	parent(X, Y).

related(X, Y) :-
	parent(X, Z),
	related(Z, Y).
