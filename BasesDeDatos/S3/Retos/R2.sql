/* Definicion de Vistas */

CREATE VIEW tickets_095 AS
(SELECT v.clave, v.fecha, a.nombre producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) empleado 
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo);
  
  
  ##Obtener el puesto de un empleado.
CREATE VIEW benny1_095 AS (
SELECT e.id_empleado, e.nombre, e.apellido_paterno, e.apellido_materno, p.nombre AS 'Puesto'
FROM empleado AS e
JOIN puesto AS p
ON p.id_puesto = e.id_puesto
ORDER BY id_empleado);

SELECT *
FROM benny1_095;

#Saber qué artículos ha vendido cada empleado.
CREATE VIEW benny2_095 AS (
SELECT v.clave AS 'clave', e.id_empleado 'id_empleado', CONCAT(e.nombre,' ',
e.apellido_paterno,' ', e.apellido_materno) AS 'nombreCompleto', a.nombre AS 'nombre_articulo'
FROM empleado AS e
JOIN venta AS v
ON  v.id_empleado = e.id_empleado
JOIN articulo a
ON v.id_articulo = a.id_articulo
ORDER BY v.clave);

SELECT *
FROM benny2_095;


#Saber qué puesto ha tenido más ventas.

CREATE VIEW benny3_095 AS (
SELECT p.nombre, count(v.clave) AS 'totalVentas'
FROM venta AS v
JOIN empleado AS e
ON v.id_empleado = e.id_empleado
JOIN puesto p
ON e.id_puesto = p.id_puesto
GROUP BY p.nombre
 );
SELECT *
FROM benny3_095
ORDER BY totalVentas DESC
LIMIT 1;