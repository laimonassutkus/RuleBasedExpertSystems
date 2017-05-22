get :- write('without quotes'), nl, writeq('with quotes').

name :-
	write('What is your name?'), nl,
	read(X),
	format('Hello, ~w!', [X]).

get_char :- get(X), put(X).

write_to_file(File, Text) :-
	open(File, write, Stream),
	write(Stream, Text), nl,
	close(Stream).

read_file(File) :-
	open(File, read, Stream),
	get_char(Stream, Char1),
	process_stream(Char1, Stream),
	close(Stream).

% !. stop backtracking (stop execution)
process_stream(end_of_file, _) :- !. 
process_stream(Char, Stream) :-
	write(Char),
	get_char(Stream, Char2),
	process_stream(Char2, Stream).
