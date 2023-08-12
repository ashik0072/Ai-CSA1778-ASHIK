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

% Backward chaining to determine if an animal is warm-blooded
is_warm_blooded(Animal) :- warm_blooded(Animal).
is_warm_blooded(Animal) :- mammal(Animal), has_fur(Animal).

% Backward chaining to determine if an animal is cold-blooded
is_cold_blooded(Animal) :- cold_blooded(Animal).
is_cold_blooded(Animal) :- reptile(Animal), has_scales(Animal).

% Required queries
?- is_warm_blooded(dog).
?- is_cold_blooded(snake).
