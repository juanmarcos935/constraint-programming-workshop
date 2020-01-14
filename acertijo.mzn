enum NOMBRES = {Juan, Oscar, Dario};
enum APELLIDOS = {Gonzalez, Garcia, Lopez};
enum MUSICA = {Clasica, Pop, Jazz};

var NOMBRES: nombre_amigo1;
var NOMBRES: nombre_amigo2;
var NOMBRES: nombre_amigo3;

var APELLIDOS: apellido_amigo1;
var APELLIDOS: apellido_amigo2;
var APELLIDOS: apellido_amigo3;

var MUSICA: musica_amigo1;
var MUSICA: musica_amigo2;
var MUSICA: musica_amigo3;

var 24..26: edad_amigo1;
var 24..26: edad_amigo2;
var 24..26: edad_amigo3;

constraint nombre_amigo1 = Juan; %Arbitrariamente asumo que el Amigo numero 1 es Juan
constraint apellido_amigo2 = Gonzalez; % Juan al ser más viejo que González implica que son distintas personas
constraint edad_amigo1 > edad_amigo2; % Restricción de que Juan es más viejo que González
constraint musica_amigo2 = Clasica; % Restricción de que a Gonzalez le gusta la música Clásica

% A quien le gusta la música pop no puede apellidarse García, ni tampoco Gonzalez (no puede ser Amigo 2), pues a Gonzalez ya le gusta la música clásica. Solo deja una opción para el fan de la música pop: que se apellide López (pudiendo ser Amigo 1 o Amigo 3). Nota: el fan del pop no tiene 24 años.

% Oscar no es Juan debido a que no pueden colisionar los nombres (Oscar no es Amigo 1), y tampoco es Lopez.


solve satisfy;