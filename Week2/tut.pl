
% Finding the last element if list
my_last(X,[X]).
my_last(X,[_|L]) :- my_last(X,L).                        

% K'th element in set
elem_at(X,[X|_], 1).
elem_at(X, [_|T], K) :- K > 1, K1 is K - 1, elem_at(X, T, K1).

% Count number of elements in the list
count(X,[],X).
count(X1, [_|T1], Z) :- Z1 is Z + 1, count(X1, T1, Z1).
count(X, [_|T]) :- Z is 1, count(X, T, Z).

my_length([],0).
my_length([_|L],N) :- my_length(L,N1), N is N1 + 1.

% Reverse a list
reverse(X, L) :- reverse(X, L, []).
reverse([], R, R).
reverse([H|T], R, Z) :- reverse(T, R, [H|Z]).