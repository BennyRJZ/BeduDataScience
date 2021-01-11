#Ejemplo 1: Selecciones con LIKE

# % caza cualquier cadena
# _ caza con caracteres

USE tienda;

#Nombres que empiecen con M
SELECT *
FROM empleado
WHERE nombre LIKE 'M%';


#Nombres que terminen con A
SELECT *
FROM empleado
WHERE nombre LIKE '%a';

#Nombres que empiecen con M y terminen con A
SELECT *
FROM empleado
WHERE nombre LIKE 'M%a';

#Nombres que empiecen con M y terminen con losa pero que contenga un caracter entre ellos
SELECT *
FROM empleado
WHERE nombre LIKE 'M_losa';