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

array[dimension_alto, dimension_ancho] of int: entrada_casillas_up =  [|-1,9,34,4,-1
                                                                       |-1,-1,-1,-1,-1
                                                                       |-1,-1,-1,-1,-1
                                                                       |-1,-1,-1,11,3
                                                                       |-1,-1,-1,-1,-1
                                                                       |-1,-1,-1,-1,-1|];
% Este array contiene las sumas hacia arriba

array[dimension_alto, dimension_ancho] of var int: salida_casillas; % El array de apoyo
array[dimension_alto, dimension_ancho] of var 0..9: salida_casillas_def; % El array principal

constraint forall(i in dimension_alto, j in dimension_ancho) (salida_casillas[i,j] = entrada_casillas[i,j]); % Se llena array de apoyo con los valores iniciales de la entrada

constraint forall(i in dimension_alto, j in dimension_ancho) (entrada_casillas_left[i,j] != -1 -> forall(k in dimension_ancho) (salida_casillas[i,k] = 0 -> salida_casillas_def[i,k] in 1..9));

array[dimension_ancho] of var 0..9: fila1 = [salida_casillas_def[1,j] | j in dimension_ancho];
array[dimension_ancho] of var 0..9: fila2 = [salida_casillas_def[2,j] | j in dimension_ancho];
array[dimension_ancho] of var 0..9: fila3 = [salida_casillas_def[3,j] | j in dimension_ancho];
array[dimension_ancho] of var 0..9: fila4 = [salida_casillas_def[4,j] | j in dimension_ancho];
array[dimension_ancho] of var 0..9: fila5 = [salida_casillas_def[5,j] | j in dimension_ancho];
array[dimension_ancho] of var 0..9: fila6 = [salida_casillas_def[6,j] | j in dimension_ancho];

constraint alldifferent_except_0(fila1);
constraint alldifferent_except_0(fila2);
constraint alldifferent_except_0(fila3);
constraint alldifferent_except_0(fila4);
constraint alldifferent_except_0(fila5);
constraint alldifferent_except_0(fila6);

array[dimension_alto] of var 0..9: columna1 = [salida_casillas_def[j,1] | j in dimension_alto];
array[dimension_alto] of var 0..9: columna2 = [salida_casillas_def[j,2] | j in dimension_alto];
array[dimension_alto] of var 0..9: columna3 = [salida_casillas_def[j,3] | j in dimension_alto];
array[dimension_alto] of var 0..9: columna4 = [salida_casillas_def[j,4] | j in dimension_alto];
array[dimension_alto] of var 0..9: columna5 = [salida_casillas_def[j,5] | j in dimension_alto];

constraint alldifferent_except_0(columna1);
constraint alldifferent_except_0(columna2);
constraint alldifferent_except_0(columna3);
constraint alldifferent_except_0(columna4);
constraint alldifferent_except_0(columna5);

solve satisfy;

output ["Solución Kakuro: \n\(fila1)\n\(fila2)\n\(fila3)\n\(fila4)\n\(fila5)\n\(fila6)"];
