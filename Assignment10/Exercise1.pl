:- dynamic male/1, female/1, parent/2.

female(anne).
female(diana).
female(elizabeth).
male(andrew).
male(charles).
male(edward).
male(harry).
male(philip).
male(william).
male(pop).

parent(andrew, elizabeth).
parent(andrew, philip).
parent(anne, elizabeth).
parent(anne, philip).
parent(charles, elizabeth).
parent(charles, philip).
parent(edward, elizabeth).
parent(edward, philip).
parent(harry, charles).
parent(harry, diana).
parent(william, charles).
parent(william, diana).
parent(elizabeth, pop).

mother(X, M) :-	parent(X,M),
	female(M).



father(X, M) :-
	parent(X,M),
	male(M).

grandparent(X, Y) :-
    parent(X, P),
    parent(P, Y).

grandfather(X, Y) :-
  grandparent(X, Y),
  male(Y).

child(X, Y) :-
  parent(Y, X).

son(X, Y) :-
  child(X, Y),
  male(Y).

daughter(X, Y) :-
  child(X, Y),
  female(Y).

grandchild(X, Y) :-
  grandparent(Y, X).

grandson(X, Y) :-
  grandchild(X, Y),
  male(Y).

granddaughter(X, Y) :-
  grandchild(X, Y),
  female(Y).

sibling(X, Y) :-	mother(X, M), mother(Y, M),
	father(X, F), father(Y, F),
	X \== Y.

brother(X, B) :-	sibling(X,B), male(B).
uncle(X, U) :-
	parent(X, P),
	brother(P, U).

sister(X, S) :-	sibling(X,S), female(S).
aunt(X, A) :-	parent(X, P), sister(P, A).

isparent(C, P) :-	mother(C, P); father(C, P).

/* equivalently:
isparent(C, P) :-	mother(C, P).
isparent(C, P) :-	father(C, P).
*/

% ------------------------------------------------------

% recursion:
ancestor(X, A) :-	parent(X, A).
ancestor(X, A) :-
	parent(X, P),
	ancestor(P, A).
