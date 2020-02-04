include "globals.mzn";

% Variables

var APELLIDOS: apellido_juan;
var APELLIDOS: apellido_oscar;
var APELLIDOS: apellido_dario;

var MUSICA: musica_juan;
var MUSICA: musica_oscar;
var MUSICA: musica_dario;

var EDADES: edad_juan;
var EDADES: edad_oscar;
var EDADES: edad_dario;

% Dominios

enum APELLIDOS = {Gonzalez, Garcia, Lopez};
enum MUSICA = {Clasica, Pop, Jazz};
set of int: EDADES = 24..26;

% Restricciones

constraint apellido_juan != Gonzalez; % Se infiere que Juan no es Gonzalez (al ser Juan mayor que González)
constraint apellido_oscar != Lopez; % Oscar no es Lopez
constraint alldifferent([apellido_juan, apellido_oscar, apellido_dario]); % Todos por lógica se apellidan distinto

constraint musica_dario != Jazz; % A Dario no le gusta el Jazz
constraint alldifferent([musica_juan, musica_oscar, musica_dario]); % Músicas distintas
constraint musica_oscar = Clasica \/ musica_dario = Clasica; % A Gonzalez le gusta la musica Clasica

constraint edad_oscar = 25; % Oscar tiene 25

constraint (apellido_oscar == Gonzalez) -> (edad_juan > edad_oscar);
constraint (apellido_dario == Gonzalez) -> (edad_juan > edad_dario);

% Juan es mayor que Gonzalez

constraint (musica_juan == Pop) -> (apellido_juan != Garcia /\ edad_juan != 24);
constraint (musica_oscar == Pop) -> (apellido_oscar != Garcia /\ edad_oscar != 24);
constraint (musica_dario == Pop) -> (apellido_dario != Garcia /\ edad_dario != 24);

% El fan de la musica Pop no puede apellidarse Garcia y no tiene 24 años

constraint (apellido_juan == Gonzalez) -> (musica_juan = Clasica);
constraint (apellido_oscar == Gonzalez) -> (musica_oscar = Clasica);
constraint (apellido_dario == Gonzalez) -> (musica_dario = Clasica);

% El que se apellide Gonzalez su musica favorita debe ser la Clasica

solve satisfy;

output ["El apellido de Juan es \(apellido_juan), su musica favorita es \(musica_juan) y su edad es \(edad_juan)\nEl apellido de Oscar es \(apellido_oscar), su musica favorita es \(musica_oscar) y su edad es \(edad_oscar)\nEl apellido de Dario es \(apellido_dario), su musica favorita es \(musica_dario) y su edad es \(edad_dario)"];
