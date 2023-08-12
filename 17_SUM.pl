sum(0, 0).
sum(N, Total) :-
    N > 0,
    Prev is N - 1,
    sum(Prev, PrevSum),
    Total is PrevSum + N.
