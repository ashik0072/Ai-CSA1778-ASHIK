% Define symptoms and diseases
symptom(fever).
symptom(cough).
symptom(sore_throat).
symptom(runny_nose).
symptom(headache).
symptom(fatigue).

disease(cold, [cough, sore_throat, runny_nose, headache, fatigue]).
disease(flue, [fever, cough, headache, fatigue]).
disease(allergies, [runny_nose, sore_throat]).

% Predicate to diagnose diseases
diagnose(Disease) :-
    write('Enter the symptoms (comma-separated): '),
    read(Symptoms),
    disease(Disease, Symptoms),
    write('You might have '), write(Disease), write('.'), nl.

diagnose(unknown) :-
    write('Sorry, we could not determine the disease based on the given symptoms.'), nl.

% Entry point
start :-
    write('Welcome to the Medical Diagnosis System.'), nl,
    diagnose(Disease),
    write('Goodbye.').
