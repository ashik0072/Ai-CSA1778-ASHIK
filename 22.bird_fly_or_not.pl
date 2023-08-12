% Facts: bird(Name, CanFly)
bird(penguin, no).
bird(sparrow, yes).
bird(ostrich, no).
bird(eagle, yes).
bird(kiwi, no).
bird(albatross, yes).

% Query to check if a bird can fly
can_fly(Bird) :-
    bird(Bird, yes),
    format('~w can fly.~n', [Bird]).
can_fly(Bird) :-
    bird(Bird, no),
    format('~w cannot fly.~n', [Bird]).

% Queries
% To check if a particular bird can fly
% ?- can_fly(sparrow).
% ?- can_fly(penguin).

% To list all birds that can fly
% ?- can_fly(Bird).
