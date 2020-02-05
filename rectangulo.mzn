include "globals.mzn";

var bool: se_construyo; % Si se construyo el rectángulo o no

int: n = 6; % Numero de cuadrados
int: anchura = 5; % Anchura del rectángulo deseado
int: altura = 4; % Altura del rectángulo deseado
set of int: DOM1 = 1..n; % Dominio para manipular la cantidad de cuadrados

array[DOM1] of int: cuadrados = [3,2,2,1,1,1];
array[DOM1] of int: areas_cuadrados = [i * i | i in cuadrados];

int: suma_areas = sum(areas_cuadrados);
int: area_rectangulo = anchura * altura;

constraint if suma_areas = area_rectangulo then se_construyo = true else se_construyo = false endif;

solve satisfy;