include "globals.mzn";

%int: ancho = 5; % Celdas de ancho del Kakuro
%int: alto = 6; % Celdas de alto del Kakuro

%int: ancho = 8;
%int: alto = 8;

int: ancho = 13;
int: alto = 13;


set of int: dimension_ancho = 1..ancho; % Dimensión de ancho del Kakuro
set of int: dimension_alto = 1..alto; % Dimensión de alto del Kakuro

%array[dimension_alto, dimension_ancho] of int: entrada_casillas = [|-1,-1,-1,-1,-1
%                                                                   |-1,0,0,0,-1
%                                                                   |-1,0,0,0,-1
%                                                                   |-1,0,0,-1,-1
%                                                                   |-1,-1,0,0,0
%                                                                   |-1,-1,0,0,0|];
%array[dimension_alto, dimension_ancho] of {-1, 0}: entrada_casillas = [|-1,-1,-1,-1,-1,-1,-1,-1
%                                                                   |-1,-1,-1,0,0,-1,-1,-1
%                                                                   |-1,-1,-1,0,0,0,-1,-1
%                                                                   |-1,0,0,0,-1,0,0,-1
%                                                                   |-1,0,0,-1,-1,-1,0,0
%                                                                   |-1,-1,0,0,-1,0,0,0
%                                                                   |-1,-1,-1,0,0,0,-1,-1
%                                                                   |-1,-1,-1,-1,0,0,-1,-1|];
array[dimension_alto, dimension_ancho] of {-1, 0}: entrada_casillas = [|-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
 |-1,-1,-1,-1,-1,0,0,-1,-1,-1,-1,0,0
 |-1,0,0,0,-1,0,0,-1,-1,0,0,0,0
 |-1,0,0,0,0,-1,0,0,0,0,0,-1,-1
 |-1,0,0,-1,0,0,0,0,0,-1,0,0,0
 |-1,-1,0,0,-1,0,0,-1,0,0,-1,0,0
 |-1,-1,0,0,-1,-1,-1,-1,0,0,0,0,0
 |-1,0,0,0,0,0,-1,-1,-1,-1,0,0,-1
 |-1,0,0,-1,0,0,-1,0,0,-1,0,0,-1
 |-1,0,0,0,-1,0,0,0,0,0,-1,0,0
 |-1,-1,-1,0,0,0,0,0,-1,0,0,0,0
 |-1,0,0,0,0,-1,-1,0,0,-1,0,0,0
 |-1,0,0,-1,-1,-1,-1,0,0,-1,-1,-1,-1|];
% Dicho Array representa las casillas disponibles para poder colocar los números, denotadas por 0, y las casillas inhabilitadas denotadas por -1

%array[dimension_alto, dimension_ancho] of int: entrada_casillas_left = [|-1,-1,-1,-1,-1
%                                                                        |9,-1,-1,-1,-1
%                                                                        |13,-1,-1,-1,-1
%                                                                        |13,-1,-1,-1,-1
%                                                                        |-1,7,-1,-1,-1
%                                                                        |-1,19,-1,-1,-1|];
%array[dimension_alto, dimension_ancho] of int: entrada_casillas_left = [|-1,-1,-1,-1,-1,-1,-1,-1
%                                                                        |-1,-1,9,-1,-1,-1,-1,-1
%                                                                        |-1,-1,24,-1,-1,-1,-1,-1
%                                                                        |7,-1,-1,-1,12,-1,-1,-1
%                                                                        |12,-1,-1,-1,-1,10,-1,-1
%                                                                        |-1,14,-1,-1,9,-1,-1,-1
%                                                                        |-1,-1,22,-1,-1,-1,-1,-1
%                                                                        |-1,-1,-1,11,-1,-1,-1,-1|];
% Este array contiene las sumas hacia la izquierda
array[dimension_alto, dimension_ancho] of int: entrada_casillas_left = 
 [|-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
 |-1,-1,-1,-1,3,-1,-1,-1,-1,-1,16,-1,-1
 |19,-1,-1,-1,4,-1,-1,-1,28,-1,-1,-1,-1
 |21,-1,-1,-1,-1,23,-1,-1,-1,-1,-1,-1,-1
 |14,-1,-1,32,-1,-1,-1,-1,-1,11,-1,-1,-1
 |-1,5,-1,-1,12,-1,-1,17,-1,-1,3,-1,-1
 |-1,4,-1,-1,-1,-1,-1,23,-1,-1,-1,-1,-1
 |23,-1,-1,-1,-1,-1,-1,-1,-1,3,-1,-1,-1
 |7,-1,-1,10,-1,-1,15,-1,-1,9,-1,-1,-1
 |6,-1,-1,-1,29,-1,-1,-1,-1,-1,6,-1,-1
 |-1,-1,23,-1,-1,-1,-1,-1,26,-1,-1,-1,-1
 |20,-1,-1,-1,-1,-1,10,-1,-1,17,-1,-1,-1
 |10,-1,-1,-1,-1,-1,6,-1,-1,-1,-1,-1,-1|];
%array[dimension_alto, dimension_ancho] of int: entrada_casillas_up =  [|-1, 9,34, 4,-1
%                                                                       |-1,-1,-1,-1,-1
%                                                                       |-1,-1,-1,-1,-1
%                                                                       |-1,-1,-1,11,3
%                                                                       |-1,-1,-1,-1,-1
%                                                                       |-1,-1,-1,-1,-1|];                                                                     
%array[dimension_alto, dimension_ancho] of int: entrada_casillas_up = [|-1,-1,-1,10,15,-1,-1,-1
%                                                                      |-1,-1,-1,-1,-1,13,-1,-1
%                                                                      |-1,7,20,-1,-1,-1,23,-1
%                                                                      |-1,-1,-1,-1,-1,-1,-1,3
%                                                                      |-1,-1,-1,14,-1,8,-1,-1
%                                                                      |-1,-1,-1,-1,17,-1,-1,-1
%                                                                      |-1,-1,-1,-1,-1,-1,-1,-1
%                                                                      |-1,-1,-1,-1,-1,-1,-1,-1|];
array[dimension_alto, dimension_ancho] of int: entrada_casillas_up = [|-1,-1,-1,-1,-1,4,16,-1,-1,-1,-1,17,16
 |-1,24,37,4,-1,-1,-1,-1,-1,16,7,-1,-1
 |-1,-1,-1,-1,16,-1,-1,3,30,-1,-1,-1,-1
 |-1,-1,-1,-1,-1,17,-1,-1,-1,-1,-1,39,6
 |-1,-1,-1,6,-1,-1,-1,-1,-1,17,-1,-1,-1
 |-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,7,-1,-1
 |-1,6,-1,-1,16,10,-1,-1,-1,-1,-1,-1,-1
 |-1,-1,-1,-1,-1,-1,-1,35,17,-1,-1,-1,-1
 |-1,-1,-1,6,-1,-1,3,-1,-1,17,-1,-1,7
 |-1,-1,-1,-1,17,-1,-1,-1,-1,-1,16,-1,-1
 |-1,16,4,-1,-1,-1,-1,-1,3,-1,-1,-1,-1
 |-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
 |-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1|];
% Este array contiene las sumas hacia arriba

array[dimension_alto, dimension_ancho] of var int: salida_casillas; % El array de apoyo
array[dimension_alto, dimension_ancho] of var 0..9: salida_casillas_def; % El array principal

constraint forall(i in dimension_alto, j in dimension_ancho) (salida_casillas[i,j] = entrada_casillas[i,j]); % Se llena array de apoyo con los valores iniciales de la entrada

constraint forall(i in dimension_alto, j in dimension_ancho) (entrada_casillas_left[i,j] != -1 -> forall(k in dimension_ancho) (salida_casillas[i,k] = 0 -> salida_casillas_def[i,k] in 1..9)); % Solo rellena las celdas disponibles (sumas filas)

constraint forall(j in dimension_ancho, i in dimension_alto) (entrada_casillas_up[i,j] != -1 -> forall(k in dimension_alto) (salida_casillas[k,i] = 0 -> salida_casillas_def[k,i] in 1..9)); % Solo rellena las celdas disponibles (sumas columnas)

constraint forall(i in dimension_alto, j in dimension_ancho) (entrada_casillas_left[i,j] != -1 -> sum([salida_casillas_def[i,k] | k in j+1..(if has_element(-1,[entrada_casillas[i,l] | l in j+1..ancho]) then [m | m in j+1..ancho where entrada_casillas[i,m] = -1][1]-1 else ancho endif)]) = entrada_casillas_left[i,j] /\ alldifferent([salida_casillas_def[i,k] | k in j+1..(if has_element(-1,[entrada_casillas[i,l] | l in j+1..ancho]) then [m | m in j+1..ancho where entrada_casillas[i,m] = -1][1]-1 else ancho endif)]));

constraint forall(j in dimension_ancho, i in dimension_alto) (entrada_casillas_up[i,j] != -1 -> sum([salida_casillas_def[k,j] | k in i+1..(if has_element(-1,[entrada_casillas[l,j] | l in i+1..alto]) then [m | m in i+1..alto where entrada_casillas[m,j] = -1][1]-1 else alto endif)]) = entrada_casillas_up[i,j] /\ alldifferent([salida_casillas_def[k,j] | k in i+1..(if has_element(-1,[entrada_casillas[l,j] | l in i+1..alto]) then [m | m in i+1..alto where entrada_casillas[m,j] = -1][1]-1 else alto endif)]));


solve satisfy;

output ["Solución Kakuro: \n"] ++ [show_int(1,salida_casillas_def[i,j]) ++ " " ++ if j == ancho then "\n" else " " endif | i in dimension_alto, j in dimension_ancho];
