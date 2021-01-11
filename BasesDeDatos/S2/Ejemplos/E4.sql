#Ejemplo 4, Subconsultas.

#Queremos los empleados cuyo puesto es Junior Executive

#Para realizar la subconsulta, descompongamos el problema en partes. 
#Primero necesitamos saber el identificador de los puestos con ese nombre.


SELECT id_puesto
FROM puesto
WHERE nombre = 'Junior Executive';

#Ya que tenemos esta consulta, buscamos la informacion de los empleados usando la consulta anterior como
#subconsulta

SELECT *
FROM empleado
WHERE id_puesto IN 
   (SELECT id_puesto
   FROM puesto
   WHERE nombre = 'Junior Executive');
   
/*
Ahora queremos saber cuál es la menor y mayor cantidad de ventas de un artículo. 
Nuevamente, volvemos a descomponer el problema. 
Primero, obtengamos la cantidad de piezas por venta de un artículo.
*/

SELECT clave, id_articulo, count(*) AS cantidad
FROM venta
GROUP BY clave, id_articulo
ORDER BY clave;

/*
Ahora, sobre la tabla resultante hacemos un nuevo agrupamiento 
para obtener la cantidad mínima y máxima de cada artículo, sin importar la venta.
*/
SELECT id_articulo, min(cantidad), max(cantidad)
FROM 
   (SELECT clave, id_articulo, count(*) AS cantidad
   FROM venta
   GROUP BY clave, id_articulo
   ORDER BY clave) AS subconsulta
GROUP BY id_articulo;

/*
Ahora, obtendremos el sueldo de cada empleado usando una subconsulta. 
Para ello, obtenemos primero el sueldo de cada tipo de empleado y luego lo usamos como subconsulta.
*/
SELECT nombre, apellido_paterno, (SELECT salario FROM puesto WHERE id_puesto = e.id_puesto) AS sueldo
FROM empleado AS e;	
