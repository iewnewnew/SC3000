queen(queen_elizabeth).

% declaring all females
female(queen_elizabeth).
female(princess_ann).

% declaring all males
male(prince_charles).
male(prince_edward).
male(prince_andrew).


% declaring all children of elizabeth
offspring(prince_charles, queen_elizabeth).
offspring(princess_ann, queen_elizabeth).
offspring(prince_andrew, queen_elizabeth).
offspring(prince_edward, queen_elizabeth).


% declaring who is older than who
older_than(prince_charles, princess_ann).
older_than(princess_ann, prince_andrew).
older_than(prince_andrew, prince_edward).

% eg. charles is older than ann
older(A,B):- older_than(A,B).
older(A,B):- older_than(A,X), older(X,B).


% rules for checking successor
successor(X, Y):- child(Y,X).

% successionList gives us all successors of X
successionList(X, SuccessionList):-
	findall(Y, successor(X, Y), SuccessionList).


% ------------ QUESTION 2 ------------ %


% checking who should precede who
% choose the older child regardless of gender
precedes(X, Y):- offspring(X, A), offspring(Y, A), older(X, Y), not(queen(X)), not(queen(Y)).

% sorting algorithm
sort_succession_list([A|B], SortedList):- sort_succession_list(B, Sorted_Tail), insert(A, Sorted_Tail, SortedList).
sort_succession_list([], []).

insert(A, [B|C], [B|D]):- not(precedes(A,B)), !, insert(A, C, D).
insert(A, C, [A|C]).

sortedSuccessionList(X, SuccessionList):-
	findall(Y, offspring(Y,X), Offspring), sort_succession_list(Offspring, SuccessionList).
