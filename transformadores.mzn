% Constantes (cantidad de material ferromagnético y horas de trabajo):
int: cantidad_toneladas_material_ferromagnetico = 6;
int: cantidad_horas_de_trabajo = 28;
int: cantidad_toneladas_t1 = 2;
int: cantidad_toneladas_t2 = 1;
int: cantidad_horas_t1 = 7;
int: cantidad_horas_t2 = 8;
int: precio_venta_t1 = 120000;
int: precio_venta_t2 = 80000;

% Transformadores
var int: t1; % Número de unidades de Transformador 1
var int: t2; % Número de unidades de Transformador 2

% Restricciones de no negatividad:
constraint t1 >= 0;
constraint t2 >= 0;

% Toneladas de material ferromagnético disponibles
var int: cantidad_toneladas_material_ferromagnetico_utilizadas = cantidad_toneladas_t1*t1 + cantidad_toneladas_t2*t2;
constraint cantidad_toneladas_material_ferromagnetico_utilizadas <= cantidad_toneladas_material_ferromagnetico;

% Horas de trabajo disponibles
var int: cantidad_horas_de_trabajo_utilizadas = cantidad_horas_t1*t1 + cantidad_horas_t2*t2;
constraint cantidad_horas_de_trabajo_utilizadas <= cantidad_horas_de_trabajo;

% Maximizar ganancia
var int: f = precio_venta_t1*t1 + precio_venta_t2*t2;
solve maximize f;

output ["Cantidad de Transformadores 1: \(t1)\nCantidad de Transformadores 2: \(t2)\nGanancia total: \(f)\nUtilizando \(cantidad_toneladas_material_ferromagnetico_utilizadas) toneladas de material ferromagnético y \(cantidad_horas_de_trabajo_utilizadas) horas de trabajo"]; 