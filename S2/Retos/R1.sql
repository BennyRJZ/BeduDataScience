/*
¿Qué artículos incluyen la palabra Pasta en su nombre?
¿Qué artículos incluyen la palabra Cannelloni en su nombre?
¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
*/
USE tienda;
SHOW tables;
DESCRIBE articulo;

/*
¿Qué artículos incluyen la palabra Pasta en su nombre?
*/
SELECT * 
FROM articulo 
WHERE nombre LIKE '%Pasta%';

/*
¿Qué artículos incluyen la palabra Cannelloni en su nombre?

*/

SELECT * 
FROM articulo 
WHERE nombre LIKE '%Cannelloni%';

/*
¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
*/
SELECT * 
FROM articulo 
WHERE nombre LIKE '% - %';
