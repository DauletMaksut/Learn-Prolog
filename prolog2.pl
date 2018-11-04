cartesian(X, Y, Z) :-
	bagof(pair(A, B), (member(A, X),member(B, Y)), Z).

deepmember(X, [X|_]) :-
	member(X, [X|_]).

deepmember(X, [H|_]) :-
	deepmember(X, H).

deepmember(X, [_|T]) :-
	deepmember(X, T).

notcontains(X, L) :-
	\+ member(X, L).

setinsertion(X, S1, S2):-
	member(X,S1), S2=S1.

setinsertion(X, S1, S2):-
	notcontains(X,S1), 
	append(S1,[X],S2).

allvertices(G, L):-
	member([X|_], G),
	append(X, L).
	

graph1([[1,2],[1,3],[2,3],[3,4],[4,1]]).
graph2([[1,2],[2,3],[2,4],[3,4],[4,3],[3,1],[4,1]]).
graph3([[1,2],[1,3],[2,3],[3,2],[3,4],[2,4],[4,6],[4,5],[5,6],[6,5],[6,7],[5,7],[7,1]]).

