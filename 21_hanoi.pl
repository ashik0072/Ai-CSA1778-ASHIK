% Rules to solve Towers of Hanoi
hanoi(1, A, _, C, Moves) :-
    append([[A, C]], [], Moves).
hanoi(N, A, B, C, Moves) :-
    N > 1,
    M is N - 1,
    hanoi(M, A, C, B, Moves1),
    append(Moves1, [[A, C]], Moves2),
    hanoi(M, B, A, C, Moves3),
    append(Moves2, Moves3, Moves).

% Predicate to start the Towers of Hanoi
towers_of_hanoi(N, Solution) :-
    hanoi(N, 'A', 'B', 'C', Solution).
