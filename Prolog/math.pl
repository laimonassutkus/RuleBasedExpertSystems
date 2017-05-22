double_digit(X, Y) :-
	Y is X * 2.

get_random :-
	random(0,10,X),
	format('~w', [X]).

get_between :-
	between(0, 10, X),
	format('~w', [X]).

increment(X) :-
	succ(X, Y),
	format('~w', [Y]).

absolute(X) :-
	Y is abs(X),
	format('~w', [Y]).

maximum(X, Y) :-
	Z is max(X, Y),
	format('Maximum between two given values is: ~w', [Z]).

get_round(X) :-
	Y is round(X),
	format('~w', [Y]).

get_truncate(X) :-
	Y is truncate(X),
	format('~w', [Y]).

power(X, Y) :-
	Z is X ** Y,
	format('~w', [Z]).

is_even(X) :-
	Y is X // 2, X =:= 2 * Y.

