include "globals.mzn";

int: n;
set of int: dominio = 0..n-1;

array[dominio] of var dominio: secuencia;

constraint forall(i in dominio) (among(secuencia[i], secuencia, i..i));

var int: suma = sum(i in dominio) (secuencia[i]);

constraint suma = n;

var int: suma2 = sum(i in dominio) (secuencia[i] * i-1);

constraint suma2 = 0;

solve satisfy;

output ["\(secuencia) es una secuencia mágica de longitud \(n)"];