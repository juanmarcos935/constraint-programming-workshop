include "alldifferent.mzn";

int: subcuadricula = 3;
int: cuadricula = 9;

entrada = [|0, 9, 0, 0, 0, 0, 0, 1, 0
           |8, 0, 4, 0, 2, 0, 3, 0, 7
           |0, 6, 0, 9, 0, 7, 0, 2, 0
           |0, 0, 5, 0, 3, 0, 1, 0, 0
           |0, 7, 0, 5, 0, 1, 0, 3, 0
           |0, 0, 3, 0, 9, 0, 8, 0, 0
           |0, 2, 0, 8, 0, 5, 0, 6, 0
           |1, 0, 7, 0, 6, 0, 4, 0, 9
           |0, 3, 0, 0, 0, 0, 0, 8, 0|];

set of int: dimension_subcuadricula = 1..subcuadricula;
set of int: dimension_cuadricula = 1..cuadricula;

array[dimension_cuadricula,dimension_cuadricula] of 0..cuadricula: entrada;
array[dimension_cuadricula,dimension_cuadricula] of var dimension_cuadricula: salida;

constraint forall(i,j in dimension_cuadricula)
                    (if entrada[i,j] > 0 then salida[i,j] = entrada[i,j] else true endif);
                    
%constraint alldifferent([salida[1,j] | j in dimension_cuadricula]);
%constraint alldifferent([salida[2,j] | j in dimension_cuadricula]);
%constraint alldifferent([salida[3,j] | j in dimension_cuadricula]);
%constraint alldifferent([salida[4,j] | j in dimension_cuadricula]);
%constraint alldifferent([salida[5,j] | j in dimension_cuadricula]);
%constraint alldifferent([salida[6,j] | j in dimension_cuadricula]);
%constraint alldifferent([salida[7,j] | j in dimension_cuadricula]);
%constraint alldifferent([salida[8,j] | j in dimension_cuadricula]);
%constraint alldifferent([salida[9,j] | j in dimension_cuadricula]);
                    
constraint forall(i in dimension_cuadricula)
                    (alldifferent([salida[i,j] | j in dimension_cuadricula]));
                    
%constraint alldifferent([salida[i,1] | i in dimension_cuadricula]);
%constraint alldifferent([salida[i,2] | i in dimension_cuadricula]);
%constraint alldifferent([salida[i,3] | i in dimension_cuadricula]);
%constraint alldifferent([salida[i,4] | i in dimension_cuadricula]);
%constraint alldifferent([salida[i,5] | i in dimension_cuadricula]);
%constraint alldifferent([salida[i,6] | i in dimension_cuadricula]);
%constraint alldifferent([salida[i,7] | i in dimension_cuadricula]);
%constraint alldifferent([salida[i,8] | i in dimension_cuadricula]);
%constraint alldifferent([salida[i,9] | i in dimension_cuadricula]);
                    
constraint forall(j in dimension_cuadricula)
                    (alldifferent([salida[i,j] | i in dimension_cuadricula]));
                    
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_uno = [salida[i,j] | i,j in 1..3];
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_dos = [salida[i,j] | i in 1..3, j in 4..6];
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_tres = [salida[i,j] | i in 1..3, j in 7..9];
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_cuatro = [salida[i,j] | i in 4..6, j in 1..3];
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_cinco = [salida[i,j] | i in 4..6, j in 4..6];
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_seis = [salida[i,j] | i in 4..6, j in 7..9];
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_siete = [salida[i,j] | i in 7..9, j in 1..3];
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_ocho = [salida[i,j] | i in 7..9, j in 4..6];
array[dimension_cuadricula] of var dimension_cuadricula: subcuadricula_nueve = [salida[i,j] | i in 7..9, j in 7..9];

constraint alldifferent(subcuadricula_uno);
constraint alldifferent(subcuadricula_dos);
constraint alldifferent(subcuadricula_tres);
constraint alldifferent(subcuadricula_cuatro);
constraint alldifferent(subcuadricula_cinco);
constraint alldifferent(subcuadricula_seis);
constraint alldifferent(subcuadricula_siete);
constraint alldifferent(subcuadricula_ocho);
constraint alldifferent(subcuadricula_nueve);


array[dimension_cuadricula] of var dimension_cuadricula: fila_uno = [salida[1,j] | j in dimension_cuadricula];
array[dimension_cuadricula] of var dimension_cuadricula: fila_dos = [salida[2,j] | j in dimension_cuadricula];
array[dimension_cuadricula] of var dimension_cuadricula: fila_tres = [salida[3,j] | j in dimension_cuadricula];
array[dimension_cuadricula] of var dimension_cuadricula: fila_cuatro = [salida[4,j] | j in dimension_cuadricula];
array[dimension_cuadricula] of var dimension_cuadricula: fila_cinco = [salida[5,j] | j in dimension_cuadricula];
array[dimension_cuadricula] of var dimension_cuadricula: fila_seis = [salida[6,j] | j in dimension_cuadricula];
array[dimension_cuadricula] of var dimension_cuadricula: fila_siete = [salida[7,j] | j in dimension_cuadricula];
array[dimension_cuadricula] of var dimension_cuadricula: fila_ocho = [salida[8,j] | j in dimension_cuadricula];
array[dimension_cuadricula] of var dimension_cuadricula: fila_nueve = [salida[9,j] | j in dimension_cuadricula];


solve satisfy;

output ["Sudoku resuelto: \n\(fila_uno)\n\(fila_dos)\n\(fila_tres)\n\(fila_cuatro)\n\(fila_cinco)\n\(fila_seis)\n\(fila_siete)\n\(fila_ocho)\n\(fila_nueve)"];
