include "globals.mzn";

% Niveles de octano, valor de presión y volatilidad por cada ingrediente
% Multiplicados por 10 para que puedan ser enteros
array[1..3] of int: octano = [1200, 1000, 740]; 
array[1..3] of int: valor_presion = [600, 25, 40];
array[1..3] of int: volatilidad = [1050, 30, 120];

% Costo por galón de cada ingrediente, multiplicados por 100 para que puedan ser enteros
array[1..3] of int: costos = [58, 155, 85];

% La cantidad de galones a usar de cada ingrediente
array[1..3] of var int: solucion;

% Restricción de no negatividad
constraint forall(i in 1..3) (solucion[i] >= 0);

% Debe sumar 12.000 galones
var int: suma = sum(i in 1..3) (solucion[i]);
constraint suma = 12000;

% Restricción de nivel de Octano por galón
var int: suma_octano = sum(i in 1..3) (solucion[i] * octano[i]);
constraint (suma_octano / 12000) >= 890;

% Restricción de nivel de Valor de presión por galón
var int: suma_presion = sum(i in 1..3) (solucion[i] * valor_presion[i]);
constraint (suma_presion / 12000) <= 110;

% Restricción de nivel de Volatilidad por galón
var int: suma_volatilidad = sum(i in 1..3) (solucion[i] * volatilidad[i]);
constraint (suma_volatilidad / 12000) >= 170;

% Función objetivo a minimizar
var int: f = sum(i in 1..3) (solucion[i] * costos[i]);

solve minimize f;

output ["Se utilizaron \(solucion[1]) galones de Butano, \(solucion[2]) galones de Catalítico Reformado, \(solucion[3]) galones de Nafta Pesado, para alcanzar un nivel de \((suma_octano / 12000) / 10) Octano por Galón de Gasolina, un valor de \((suma_presion / 12000) / 10) Valor de Presión por Galón de Gasolina y un valor de \((suma_volatilidad / 12000) / 10) Volatilidad por Galón de Gasolina, con un gasto total de \(f / 100) dolares"];

