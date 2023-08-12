% Facts: parent(Parent, Child)
parent(john, mary).
parent(john, robert).
parent(mary, ann).
parent(robert, jim).
parent(robert, lisa).
parent(lisa, emma).

% Rules: ancestor(Ancestor, Descendant)
ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

    % Rules: sibling(Sibling1, Sibling2)
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% Query Examples
% To find the parent of a child
% ?- parent(Parent, ann).

% To find all ancestors of a person
% ?- ancestor(X, emma).

% To find siblings of a person
% ?- sibling(jim, lisa).
