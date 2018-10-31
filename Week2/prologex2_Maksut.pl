% task 1
cartesian(M,N,R):- findall(pair(X,Y), (member(X,M), member(Y,N)), R).
% task 2
deepmember(X, [X|_]).
deepmember(X, [H|T]) :- deepmember(X, H); deepmember(X, T).
% task 3
notcontains(X, Y) :-
	\+ member(X, Y).
% task 4
setinsertion(X, Y, Z):-
	member(X,Y), Z=Y.
setinsertion(X, Y, Z):-
	notcontains(X,Y), 
	append(Y,[X],Z).
% taks 5 data
graph1([[1,2],[1,3],[2,3],[3,4],[4,1]]).
graph2([[1,2],[2,3],[2,4],[3,4],[4,3],[3,1],[4,1]]).
graph3([[1,2],[1,3],[2,3],[3,2],[3,4],[2,4],[4,6],[4,5],[5,6],[6,5],[6,7],[5,7],[7,1]]).
% task 5 a
allvertices([], [_]).
allvertices([[H1,T1]|T], L) :- allvertices(T, L1), setinsertion(H1, L1, L2), setinsertion(T1, L2, L).
% task 5 b
connected(V0,V1,[[H,T]|Rem]) :- (V0=H, V1=T); connected(V0,V1, Rem).
% task 5 c
path(_, V, 1, _, [V], V).
path(G, Vbegin, N, Forbidden, Path, Vend) :- 
	N1 is N - 1,
	connected(Vbegin, Next, G), 
	notcontains(Next, Forbidden), 
	path(G, Next, N1 , [Next|Forbidden], NewPath, Vend),
	Path = [Vbegin|NewPath].
% task 5 d
hamiltoniancircuit( G, C ) :- 
	allvertices( G, Vert ),
	Vert = [ V0 | _ ],
	length( Vert, N ),
	path( G, V0, N, [ V0 ], C, LastV ),
	connected( LastV, V0, G ).