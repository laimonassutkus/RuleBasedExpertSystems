has(laimonas, girl).

friends(laimonas, female(girl(greta))).

customer(tom, young, 100.0).
customer(dan, young, 200.0).
customer(sam, young, 300.0).
customer(josh, old, 1000.50).

get_young_money :-
	customer(_, young, Money),
	format('This young person has ~w.', [Money]).

get_balance(Name) :-
	customer(Name, _, Balance),
	write(Balance).


vertical(line(point(X, Y), point(X, Y2))).
horizontal(line(point(X, Y), point(X2, Y))).

get_vertical(X, Y) :-
	vertical(line(point(X, Y), Z)),
	write(Z).
