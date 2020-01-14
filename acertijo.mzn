enum APELLIDOS = {Gonzalez, Garcia, Lopez};
enum MUSICA = {Clasica, Pop, Jazz};

var APELLIDOS: apellido_juan;
var APELLIDOS: apellido_oscar;
var APELLIDOS: apellido_dario;

var MUSICA: musica_juan;
var MUSICA: musica_oscar;
var MUSICA: musica_dario;

var 24..26: edad_juan;
var 24..26: edad_oscar;
var 24..26: edad_dario;

constraint edad_juan > edad_oscar \/ edad_juan > edad_dario; % Juan es mayor que González, González es una persona distinta a Juan, pero existe la posibilidad de que quien se apellide González sea Oscar o Dario.
constraint musica_oscar = Clasica \/ musica_dario = Clasica; % Entonces nos deja la posibilidad de que a Oscar le guste la musica clásica o a Dario le guste la música Clásica.



constraint apellido_oscar != Lopez; % Oscar no se apellida Lopez
constraint edad_oscar = 25; % Oscar tiene 25
constraint musica_dario != Jazz; % la musica favorita de Dario no es el Jazz


solve satisfy;