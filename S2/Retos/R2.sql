/*
¿Cuál es el promedio de salario de los puestos?
¿Cuántos artículos incluyen la palabra Pasta en su nombre?
¿Cuál es el salario mínimo y máximo?
¿Cuál es la suma del salario de los últimos cinco puestos agregados?
*/

SHOW TABLES;


#¿Cuál es el promedio de salario de los puestos?
SELECT AVG(salario)
FROM puesto;

#¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(nombre)
FROM articulo
WHERE nombre LIKE "%Pasta%";

#¿Cuál es el salario mínimo y máximo?
SELECT MIN(salario),MAX(salario)
FROM puesto;


#¿Cuál es la suma del salario de los últimos cinco puestos agregados?
DESCRIBE puesto;

SELECT max(id_puesto) - 5
FROM puesto; 

SELECT sum(salario) 
FROM puesto
WHERE id_puesto >995;