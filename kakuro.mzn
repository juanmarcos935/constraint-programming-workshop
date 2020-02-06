include "globals.mzn";

int: ancho = 5; % Celdas de ancho del Kakuro
int: alto = 6; % Celdas de alto del Kakuro

set of int: dimension_ancho = 1..ancho; % Dimensión de ancho del Kakuro
set of int: dimension_alto = 1..alto; % Dimensión de alto del Kakuro

array[dimension_alto, dimension_ancho] of int: entrada_casillas = [|-1,-1,-1,-1,-1
                                                                   |-1,0,0,0,-1
                                                                   |-1,0,0,0,-1
                                                                   |-1,0,0,-1,-1
                                                                   |-1,-1,0,0,0
                                                                   |-1,-1,0,0,0|];
% Dicho Array representa las casillas disponibles para poder colocar los números, denotadas por 0, y las casillas inhabilitadas denotadas por -1

array[dimension_alto, dimension_ancho] of int: entrada_casillas_left = [|-1,-1,-1,-1,-1
                                                                        |9,-1,-1,-1,-1
                                                                        |13,-1,-1,-1,-1
                                                                        |13,-1,-1,-1,-1
                                                                        |-1,7,-1,-1,-1
                                                                        |-1,19,-1,-1,-1|];
% Este array contiene las sumas hacia la izquierda

array[dimension_alto, dimension_ancho] of int: entrada_casillas_up =  [|-1, 9,34, 4,-1
                                                                       |-1,-1,-1,-1,-1
                                                                       |-1,-1,-1,-1,-1
                                                                       |-1,-1,-1,11,3
                                                                       |-1,-1,-1,-1,-1
                                                                       |-1,-1,-1,-1,-1|];
% Este array contiene las sumas hacia arriba

array[dimension_alto, dimension_ancho] of var int: salida_casillas; % El array de apoyo
array[dimension_alto, dimension_ancho] of var 0..9: salida_casillas_def; % El array principal

constraint forall(i in dimension_alto, j in dimension_ancho) (salida_casillas[i,j] = entrada_casillas[i,j]); % Se llena array de apoyo con los valores iniciales de la entrada

constraint forall(i in dimension_alto, j in dimension_ancho) (entrada_casillas_left[i,j] != -1 -> forall(k in dimension_ancho) (salida_casillas[i,k] = 0 -> salida_casillas_def[i,k] in 1..9)); % Solo rellena las celdas disponibles (sumas filas)

constraint forall(i in dimension_alto, j in dimension_ancho) (entrada_casillas_left[i,j] != -1 -> sum([salida_casillas_def[i,k] | k in {l | l in 1..[m | m in j+1..ancho where entrada_casillas[i,m] = -1 \/ (m = ancho /\ entrada_casillas[i,m] != -1)][1] where entrada_casillas[i,l] != -1}]) = entrada_casillas_left[i,j]); % La gran restricción de las Sumas de las Filas

constraint forall(i in dimension_alto, j in dimension_ancho) (entrada_casillas_up[i,j] != -1 -> forall(k in dimension_alto) (salida_casillas[k,i] = 0 -> salida_casillas_def[k,i] in 1..9)); % Solo rellena las celdas disponibles (sumas columnas)


constraint forall(i in dimension_alto) (alldifferent_except_0([salida_casillas_def[i,j] |j in dimension_ancho])); % Filas distintas

constraint forall(i in dimension_ancho) (alldifferent_except_0([salida_casillas_def[j,i] |j in dimension_alto])); % Columnas distintas


solve satisfy;



