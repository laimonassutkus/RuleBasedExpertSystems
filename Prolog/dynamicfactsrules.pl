:- dynamic(square/2).

% asserta(square(1, 1)).
% assertz(square(100, 100)).
% retract(square(1, 1)).
% retractall(square(_, _)).
square(10, 10) :- write('Square 10x10').
