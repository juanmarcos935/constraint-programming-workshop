include "globals.mzn";

int: n;
set of int: dominio = 0..n-1;

array[dominio] of var dominio: secuencia;

constraint forall(i in dominio) (among(secuencia[i], secuencia, i..i));

var int: suma = sum(i in dominio) (secuencia[i]);

constraint suma = n;

solve satisfy;

output ["\(secuencia) es una secuencia mágica de longitud \(n)"];