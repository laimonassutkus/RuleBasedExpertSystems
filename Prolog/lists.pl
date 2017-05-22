get_list :- 
	format('~w', [[ob0 | [eob1, ob2, ob3]]]).

len :-
	length([1, 2, 3], X),
	write(X).

% heads and tails
% [H|T] = [a,b,c].

% assign
% [X1, X2, X3] = [a, b, c].
% [_, X2, _, _ | T] = [a, b, c, d].

contains :-
	List = [a, b, c],
	member(a, List).

looplist :-
	List = [1, 2, 3, 4, 5],
	member(X, List),
	write(X).

% reverse([1, 2, 3], X).
% append([1, 2, 3], [4, 5, 6], X).

write_list([]).
write_list([Head|Tail]) :- 
	write(Head), nl,
	write_list(Tail).
