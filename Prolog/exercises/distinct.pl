print_list([]).

print_list([Head|Tail]) :- 
	write(Head), nl,
	print_list(Tail).

distinct(List) :- distinct(List, []).

distinct([Head|Tail], DistinctList) :-
	(
	\+ member(Head, DistinctList) -> 
	append(DistinctList, [Head], X),
	print_list(X),
	distinct(Tail, X) ;
	distinct(Tail, DistinctList)
	).
