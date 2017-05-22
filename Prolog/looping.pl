count(10) :- write(10), nl.
count(X) :-
	write(X), nl,
	Y is X + 1,
	count(Y).

count_down(Low, High) :-
	between(Low, High, Y),
	Z is High - Y + Low,
	write(Z), nl.
