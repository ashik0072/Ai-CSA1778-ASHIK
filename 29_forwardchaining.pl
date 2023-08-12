% Define facts and rules
mammal(dog).
mammal(cat).
mammal(horse).
reptile(snake).
reptile(crocodile).

has_fur(dog).
has_fur(cat).
has_fur(horse).
has_scales(snake).
has_scales(crocodile).

% Rule: An animal is warm-blooded if it's a mammal
warm_blooded(X) :- mammal(X).

% Rule: An animal is cold-blooded if it's a reptile
cold_blooded(X) :- reptile(X).

% Rule: An animal is a mammal if it has fur
mammal(X) :- has_fur(X).

% Rule: An animal is a reptile if it has scales
reptile(X) :- has_scales(X).

% Required queries
?- warm_blooded(dog).
?- cold_blooded(snake).
