include "alldifferent.mzn";

int: subcuadricula = 3; % Variable que determina la dimensión de las subcuadrículas
int: cuadricula = 9; % Variable que determina la dimensión de la cuadrícula grande

array[dimension_cuadricula,dimension_cuadricula] of 0..cuadricula: entrada; % Matriz de entrada, el input del Sudoku, que contiene ya algunos números en algunas celdas (en este caso el número 0 representa vacío, que no tiene número).

set of int: dimension_cuadricula = 1..cuadricula; % Dominio de las cuadriculas: numeros del 1 al 9

array[dimension_cuadricula,dimension_cuadricula] of var dimension_cuadricula: salida; % La matriz con la que va a trabajar el programa y aplicar las restricciones, la salida

constraint forall(i,j in dimension_cuadricula)
                    (if entrada[i,j] > 0 then salida[i,j] = entrada[i,j] else true endif); % Sirve para copiar los números de las celdas que ya están preestablecidas en la entrada a la matriz de salida que es con el que se va a trabajar
                    
constraint forall(i in dimension_cuadricula) (alldifferent([salida[i,j] | j in dimension_cuadricula])); % Restricción que permite que los números en cada fila sean distintos
                    
constraint forall(j in dimension_cuadricula) (alldifferent([salida[i,j] | i in dimension_cuadricula])); % Restricción que permite que los números en cada columna sean distintos
                    
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_uno = [salida[i,j] | i,j in 1..3];
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_dos = [salida[i,j] | i in 1..3, j in 4..6];
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_tres = [salida[i,j] | i in 1..3, j in 7..9];
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_cuatro = [salida[i,j] | i in 4..6, j in 1..3];
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_cinco = [salida[i,j] | i in 4..6, j in 4..6];
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_seis = [salida[i,j] | i in 4..6, j in 7..9];
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_siete = [salida[i,j] | i in 7..9, j in 1..3];
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_ocho = [salida[i,j] | i in 7..9, j in 4..6];
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_nueve = [salida[i,j] | i in 7..9, j in 7..9];

% Cada array subcuadricula_uno, subcuadricula_dos hasta subcuadricula_nueve son los números que pertenecen a cada cuadrícula. 

constraint alldifferent(subcuadricula_uno);
constraint alldifferent(subcuadricula_dos);
constraint alldifferent(subcuadricula_tres);
constraint alldifferent(subcuadricula_cuatro);
constraint alldifferent(subcuadricula_cinco);
constraint alldifferent(subcuadricula_seis);
constraint alldifferent(subcuadricula_siete);
constraint alldifferent(subcuadricula_ocho);
constraint alldifferent(subcuadricula_nueve);

% Luego cada restricción que es impuesta sobre cada array de los números de cada celda permite garantizar que los números en cada celda sean todos distintos


array[dimension_cuadricula] of var dimension_cuadricula: fila_uno = [salida[1,j] | j in dimension_cuadricula];
array[dimension_cuadricula] of var dimension_cuadricula: fila_dos = [salida[2,j] | j in dimension_cuadricula];
array[dimension_cuadricula] of var dimension_cuadricula: fila_tres = [salida[3,j] | j in dimension_cuadricula];
array[dimension_cuadricula] of var dimension_cuadricula: fila_cuatro = [salida[4,j] | j in dimension_cuadricula];
array[dimension_cuadricula] of var dimension_cuadricula: fila_cinco = [salida[5,j] | j in dimension_cuadricula];
array[dimension_cuadricula] of var dimension_cuadricula: fila_seis = [salida[6,j] | j in dimension_cuadricula];
array[dimension_cuadricula] of var dimension_cuadricula: fila_siete = [salida[7,j] | j in dimension_cuadricula];
array[dimension_cuadricula] of var dimension_cuadricula: fila_ocho = [salida[8,j] | j in dimension_cuadricula];
array[dimension_cuadricula] of var dimension_cuadricula: fila_nueve = [salida[9,j] | j in dimension_cuadricula];

% Luego se crean arrays de cada fila del Sudoku simplemente para generar un output más amigable

solve satisfy;

output ["Sudoku resuelto: \n\(fila_uno)\n\(fila_dos)\n\(fila_tres)\n\(fila_cuatro)\n\(fila_cinco)\n\(fila_seis)\n\(fila_siete)\n\(fila_ocho)\n\(fila_nueve)"];
