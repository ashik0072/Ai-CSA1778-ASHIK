% Facts: Name and Date of Birth
dob(john, date(1990, 5, 15)).
dob(susan, date(1985, 12, 10)).
dob(david, date(2000, 3, 25)).
dob(emily, date(1998, 8, 5)).
dob(michael, date(1977, 9, 30)).

% Rules: Predicates to Query
age(Name, Age) :-
    dob(Name, date(Year, Month, Day)),
    get_date(date(CurrentYear, CurrentMonth, CurrentDay)),
    calculate_age(Year, Month, Day, CurrentYear, CurrentMonth, CurrentDay, Age).

get_date(date(2023, 8, 11)). % Current date for age calculation

calculate_age(Year, Month, Day, CurrentYear, CurrentMonth, CurrentDay, Age) :-
    Age is CurrentYear - Year - ( (CurrentMonth, CurrentDay) @< (Month, Day) ).

% Queries
% To find the age of a person
% ?- age(john, Age).
% ?- age(susan, Age).
% ?- age(david, Age).
% ?- age(emily, Age).
% ?- age(michael, Age).
