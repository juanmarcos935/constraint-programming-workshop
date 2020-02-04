include "globals.mzn";

enum NOMBRES = {Juan, Oscar, Dario}; % El dominio de los nombres posibles
enum APELLIDOS = {Gonzalez, Garcia, Lopez}; % El dominio de los apellidos posibles
enum MUSICA = {Clasica, Pop, Jazz}; % El dominio de las musicas favoritas posibles

set of int: EDADES = {24, 25, 26};

array[NOMBRES] of var APELLIDOS: nombre_apellido;
array[APELLIDOS] of var NOMBRES: apellido_nombre;

array[NOMBRES] of var MUSICA: nombre_musica;
array[MUSICA] of var NOMBRES: musica_nombre;

array[APELLIDOS] of var MUSICA: apellido_musica;
array[MUSICA] of var APELLIDOS: musica_apellido;

array[NOMBRES] of var EDADES: nombre_edad;
array[EDADES] of var NOMBRES: edad_nombre;

array[APELLIDOS] of var EDADES: apellido_edad;
array[EDADES] of var APELLIDOS: edad_apellido;

array[MUSICA] of var EDADES: musica_edad;
array[EDADES] of var MUSICA: edad_musica;

constraint inverse(nombre_apellido, apellido_nombre);
constraint inverse(nombre_musica, musica_nombre);
constraint inverse(apellido_musica, musica_apellido);
constraint inverse(nombre_edad, edad_nombre);
constraint inverse(apellido_edad, edad_apellido);
constraint inverse(musica_edad, edad_musica);

% Como Juan es más viejo que González, se infiere que Juan no es González:

constraint nombre_apellido[Juan] != Gonzalez;

% La Edad de Juan es mayor que la de González:

constraint nombre_edad[Juan] > apellido_edad[Gonzalez];

% A González le gusta la música clásica

constraint apellido_musica[Gonzalez] = Clasica;

% El fan de la Música Pop NO es García:

constraint musica_apellido[Pop] != Garcia;

% Quien sea fan de la Música Pop NO tiene 24:

constraint musica_edad[Pop] != 24;

% Oscar no es Lopez:

constraint nombre_apellido[Oscar] != Lopez;

% Oscar tiene 25:

constraint nombre_edad[Oscar] = 25;

% La musica favorita de Dario no es el Jazz:

constraint nombre_musica[Dario] != Jazz;

solve satisfy;


%output ["El apellido de Oscar es \(nombre_apellido[Oscar]), su musica favorita es \(nombre_musica[Oscar]) y su edad es \(nombre_edad[Oscar])\nEl apellido de Dario es \(nombre_apellido[Dario]), su musica favorita es \(nombre_musica[Dario]) y su edad es \(nombre_edad[Dario])\nEl apellido de Juan es \(nombre_apellido[Juan]), su musica favorita es \(nombre_musica[Juan]) y su edad es \(nombre_edad[Juan])"];
