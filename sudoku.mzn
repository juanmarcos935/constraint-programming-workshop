include "alldifferent.mzn";

array[1..9,1..9] of 0..9: cuadricula_input;

array[1..9,1..9] of var 0..9: cuadricula;

constraint forall(i, j in 1..9) (cuadricula[i,j] = cuadricula_input[i,j]);
array[1..9] of var 0..9: ensayo = [if cuadricula[1,i] != 0 then cuadricula[1,i] else i endif| i in 1..9];
%constraint alldifferent();

solve satisfy;
                                        
output ["cuadricula_input = \(cuadricula_input)\ncuadricula = \(cuadricula)\nensayo = \(ensayo)"];

