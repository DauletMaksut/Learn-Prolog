a(X,Y) :- d(X,Y), !.

a(X,Y) :-  b(X), c(Y).
b(a). b(b).
c(a). c(b).
d(x,y). d(y,x).