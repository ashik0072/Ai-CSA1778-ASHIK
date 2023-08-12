% Define the graph with nodes and edges
edge(a, b, 4).
edge(a, c, 2).
edge(b, d, 5).
edge(c, e, 3).
edge(d, e, 1).
edge(d, f, 3).
edge(e, f, 2).

% best_first_search(Start, Goal, Path)
best_first_search(Start, Goal, Path) :-
    heuristic(Start, H),
    best_first_search([node(Start, [Start], H)], Goal, Path).

% best_first_search(Open, Goal, Path)
best_first_search([node(Goal, Path, _)|_], Goal, Path) :- !.

best_first_search([node(Current, Path, _)|Rest], Goal, FinalPath) :-
    findall(node(Next, [Next|Path], HNew),
            (edge(Current, Next, _), not(member(Next, Path)), heuristic(Next, HNew)),
            Children),
    merge_sort(Children, SortedChildren),
    append(SortedChildren, Rest, NewOpen),
    best_first_search(NewOpen, Goal, FinalPath).

% Define the heuristic function (this can be customized)
heuristic(Node, H) :-
    goal(Goal),
    edge(Node, Goal, H).

% Define the goal node (change this according to your problem)
goal(f).

% Merge sort implementation
merge_sort([], []).
merge_sort([X], [X]).
merge_sort(List, Sorted) :-
    split(List, Left, Right),
    merge_sort(Left, SortedLeft),
    merge_sort(Right, SortedRight),
    merge(SortedLeft, SortedRight, Sorted).

split([], [], []).
split([X], [X], []).
split([X,Y|Rest], [X|Xs], [Y|Ys]) :- split(Rest, Xs, Ys).

merge([], L, L).
merge(L, [], L).
merge([X|Rest1], [Y|Rest2], [X|Result]) :- X < Y, merge(Rest1, [Y|Rest2], Result).
merge([X|Rest1], [Y|Rest2], [Y|Result]) :- X >= Y, merge([X|Rest1], Rest2, Result).

% Example usage
?- best_first_search(a, f, Path).
