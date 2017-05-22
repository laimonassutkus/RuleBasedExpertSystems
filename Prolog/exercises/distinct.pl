print_list([]).

print_list([Head|Tail]) :- 
	write(Head), nl,
	print_list(Tail).

distinct(List) :- distinct(List, []).

distinct([], DistinctList) :-
	print_list(DistinctList).

distinct([Head|Tail], DistinctList) :-
	\+ member(Head, DistinctList) -> 
	append(DistinctList, [Head], X),
	distinct(Tail, X) ;
	distinct(Tail, DistinctList).
