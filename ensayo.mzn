include "globals.mzn";

array[1..6] of int: arreglo = [-1, 0, 0, 0, -1, -1];
array[1..6] of var 1..9: arreglo2;

array[int] of int: pos = [i |i in 2..6 where arreglo[i] = -1];

var set of int: muralla = {i | i in 1..pos[1] where arreglo[i] != -1};

constraint sum([arreglo2[i] |i in muralla]) = 13;

constraint alldifferent(arreglo2);

output["\(pos)\n\(muralla)\n\(arreglo2)\n\([i |i in 2..6 where arreglo[i] = -1][1])"];