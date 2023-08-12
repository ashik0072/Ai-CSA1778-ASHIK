% Facts: planet(Name, Type, Diameter in km, Distance from Sun in million km)
planet(mercury, rocky, 4879, 57.9).
planet(venus, rocky, 12104, 108.2).
planet(earth, rocky, 12742, 149.6).
planet(mars, rocky, 6779, 227.9).
planet(jupiter, gas_giant, 139822, 778.3).
planet(saturn, gas_giant, 116464, 1427.0).
planet(uranus, ice_giant, 50724, 2871.0).
planet(neptune, ice_giant, 49244, 4497.1).

% Queries
% To find information about a specific planet
% ?- planet(venus, Type, Diameter, Distance).

% To find all rocky planets
% ?- planet(Name, rocky, _, _).

% To find all gas giant planets
% ?- planet(Name, gas_giant, _, _).

% To find all planets with a diameter greater than a certain value
% ?- planet(Name, _, Diameter, _), Diameter > 50000.
