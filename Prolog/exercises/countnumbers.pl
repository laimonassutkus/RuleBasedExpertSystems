count_nums(List) :- count_nums(List, 0).

count_nums([], Counter) :-
	format('Total number of numbers in a given list is ~w.', [Counter]).

count_nums([Head | Tail], Counter) :-
	number(Head) ->
	succ(Counter, X),
	count_nums(Tail, X) ;
	count_nums(Tail, Counter).
