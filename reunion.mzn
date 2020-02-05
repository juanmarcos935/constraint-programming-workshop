include "globals.mzn";
int: n = 8; % Numero de personas que saldrán en la foto
enum PERSONAS = {Jose, Julian, Diana, Juan, David, Claudia, Edgar, Mario}; % Conjunto de las posibles personas que saldrán en la foto

int: cantidad_nexts = 1; % Cantidad de restricciones next
int: cantidad_separates = 1; % Cantidad de restricciones separate
int: cantidad_distancias = 1; % Cantidad de restricciones distancia

set of int: DOMINIO1 = 1..n; % Dominio de 1 hasta el número de personas en la foto
set of int: DOMINIO2 = 1..2; % Dominio para las duplas de los arreglos next y separate
set of int: DOMINIO3 = 1..3; % Dominio para las tripletas del arreglo distancia
set of int: DOMINIO4 = 1..cantidad_nexts; % Dominio para cuantas restricciones de next hay
set of int: DOMINIO5 = 1..cantidad_separates; % Dominio para cuantas restricciones de separate hay
set of int: DOMINIO6 = 1..cantidad_distancias; % Dominio para cuantas restricciones de distancias hay

array[DOMINIO1] of PERSONAS: entrada = [Jose, Julian, Diana, Juan, David, Claudia, Edgar, Mario]; % Array que contiene las personas que saldrán en la foto

array[DOMINIO4, DOMINIO2] of int: next = [|5, 8|]; % Input de restricciones next
array[DOMINIO5, DOMINIO2] of int: separate = [|3, 7|]; % Input de restricciones separate
array[DOMINIO6, DOMINIO3] of int: distancia = [|6, 5, 2|]; % Input de restricciones distancia

array[DOMINIO1] of var PERSONAS: salida; % Array de variables de decisión sobre el cual se van a trabajar las restricciones

constraint alldifferent(salida); % No debe de haber personas repetidas

constraint forall(i in DOMINIO1, j in DOMINIO4) (if salida[i] = entrada[next[j,1]] then if i = 1 then salida[i+1] = entrada[next[j,2]] else if i = 8 then salida[i-1] = entrada[next[j,2]] else salida[i+1] = entrada[next[j,2]] \/ salida[i-1] = entrada[next[j,2]] endif endif endif); % Next 

constraint forall(i in DOMINIO1, j in DOMINIO5) (if salida[i] = entrada[separate[j,1]] then if i = 1 then salida[i+1] != entrada[separate[j,2]] else if i = 8 then salida[i-1] != entrada[separate[j,2]] else salida[i+1] != entrada[separate[j,2]] \/ salida[i-1] != entrada[separate[j,2]] endif endif endif); % Separate 



solve satisfy;



