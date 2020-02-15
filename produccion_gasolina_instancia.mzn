include "globals.mzn";

% Niveles de octano, valor de presión y volatilidad por cada ingrediente
array[1..3] of float: octano = [120.0, 100.0, 74.0]; 
array[1..3] of float: valor_presion = [60.0, 2.5, 4.0];
array[1..3] of float: volatilidad = [105.0, 3.0, 12.0];

% Multiplicados por 10 para que puedan ser enteros
array[1..3] of var int: octano_10 = [round(octano[i] * 10) | i in 1..3];
array[1..3] of var int: valor_presion_10 = [round(valor_presion[i] * 10) | i in 1..3];
array[1..3] of var int: volatilidad_10 = [round(volatilidad[i] * 10) | i in 1..3];

% Costo por galón de cada ingrediente
array[1..3] of float: costos = [0.58, 1.55, 0.85];

% Multiplicados por 100 para que puedan ser enteros
array[1..3] of var int: costos_100 = [round(costos[i] * 100) | i in 1..3];

% La cantidad de galones a usar de cada ingrediente
array[1..3] of var int: solucion;

% Restricción de no negatividad
constraint forall(i in 1..3) (solucion[i] >= 0);

% Debe sumar 12.000 galones
var int: suma = sum(i in 1..3) (solucion[i]);
constraint suma = 12000;

% Restricción de nivel de Octano por galón
var int: suma_octano = sum(i in 1..3) (solucion[i] * octano_10[i]);
constraint (suma_octano / 12000) >= 890;

% Restricción de nivel de Valor de presión por galón
var int: suma_presion = sum(i in 1..3) (solucion[i] * valor_presion_10[i]);
constraint (suma_presion / 12000) <= 110;

% Restricción de nivel de Volatilidad por galón
var int: suma_volatilidad = sum(i in 1..3) (solucion[i] * volatilidad_10[i]);
constraint (suma_volatilidad / 12000) >= 170;

% Función objetivo a minimizar
var int: f = sum(i in 1..3) (solucion[i] * costos_100[i]);

solve minimize f;

output ["Se utilizaron \(solucion[1]) galones de Butano, \(solucion[2]) galones de Catalítico Reformado, \(solucion[3]) galones de Nafta Pesado, para alcanzar un nivel de \((suma_octano / 12000) / 10) Octano por Galón de Gasolina, un valor de \((suma_presion / 12000) / 10) Valor de Presión por Galón de Gasolina y un valor de \((suma_volatilidad / 12000) / 10) Volatilidad por Galón de Gasolina, con un gasto total de \(f / 100) dolares"];

