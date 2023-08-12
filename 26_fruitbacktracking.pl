% Define the fruits and their colors
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(lemon, yellow).
fruit_color(lime, green).
fruit_color(blueberry, blue).
fruit_color(strawberry, red).

% Predicate to query the color of a fruit
color_of(Fruit, Color) :- fruit_color(Fruit, Color).

% Predicate to find all fruits of a given color
fruits_of_color(Color, Fruits) :- setof(Fruit, fruit_color(Fruit, Color), Fruits).

% Predicate to find all colors of a given fruit
colors_of_fruit(Fruit, Colors) :- setof(Color, fruit_color(Fruit, Color), Colors).
