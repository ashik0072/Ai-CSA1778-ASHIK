% Facts: Foods and their glycemic index (GI)
food_gi(apple, 40).
food_gi(banana, 60).
food_gi(carrot, 30).
food_gi(bread, 70).
food_gi(rice, 70).
food_gi(yogurt, 30).
food_gi(chicken, 0).
food_gi(fish, 0).
food_gi(beans, 30).
food_gi(spinach, 15).

% Rules: Suggesting a diet based on disease (diabetes)
suggest_diet(Disease) :-
    Disease = diabetes,
    write("Welcome to the Diabetes Diet System."), nl,
    write("Please enter your daily food preferences: "), nl,
    read(Food),
    process_food(Food).

process_food(Food) :-
    food_gi(Food, GI),
    interpret_gi(GI).

interpret_gi(GI) :-
    GI =< 55,
    write("Low glycemic food. You can include this in your diet."), nl.

interpret_gi(GI) :-
    GI > 55,
    write("High glycemic food. Consume in moderation or avoid if possible."), nl.

% Main query
:- initialization(main).

main :-
    write("Enter the disease: "), nl,
    read(Disease),
    suggest_diet(Disease),
    halt.
