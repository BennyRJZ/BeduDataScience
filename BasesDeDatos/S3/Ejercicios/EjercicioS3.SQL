#1 Cantidad de Productos de cada orden
USE classicmodels;


SELECT o.orderNumber AS orderNumber, COUNT(p.productCode) as quantity
FROM orders AS o
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
JOIN products AS p 
ON p.productCode = od.productCode
GROUP BY o.orderNumber;

#2 Obten el número de orden, estado y costo total de cada orden.
SELECT o.orderNumber AS orderNumber, o.status AS status, ROUND(SUM(p.amount),2) AS total
	FROM orders AS o
    JOIN payments AS p
		ON  o.customerNumber = p.customerNumber
	GROUP BY orderNumber;
    
#3 Obten el número de orden, fecha de orden, línea de orden, nombre del producto, 
#cantidad ordenada y precio de cada pieza.
SELECT od.orderNumber, o.orderDate, od.orderLineNumber, p.productName, od.quantityOrdered, od.priceEach
FROM orderdetails AS od
JOIN orders as o
  ON od.orderNumber = o.orderNumber
JOIN products AS p
  ON od.productCode = od.productCode;
#4 Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp)
# y precio de cada pieza.
SELECT od.orderNumber,p.productName, p.MSRP, od.priceEach
FROM orderdetails AS od
JOIN products AS p
 ON od.productCode=p.productCode;
 
 
 #####LEFT JOIN
/* Obtén el número de cliente, nombre de cliente, número de orden y estado de cada orden hecha
 por cada cliente. 
 ¿De qué nos sirve hacer LEFT JOIN en lugar de JOIN?
 R= Para extraer todos los registros de una tabla aunque en las relaciones no haya un valor*/
 
 
 SELECT c.customerNumber AS 'customerNumber', c.customerName AS 'customerNAmer',
 o.orderNumber AS 'orderNumber', o.status AS 'orderStatus'
 FROM customers AS c
 LEFT JOIN orders AS o
 ON c.customerNumber = o.customerNumber;
 
 /* 
 Obtén los clientes que no tienen una orden asociada.*/
 
 SELECT c.customerNumber AS 'customerNumber', c.customerName AS 'customerNAmer',
 o.orderNumber AS 'orderNumber', o.status AS 'orderStatus'
 FROM customers AS c
 LEFT JOIN orders AS o
 ON c.customerNumber = o.customerNumber
 WHERE o.customerNumber IS NULL;
 
 /* 7.- Obtén el apellido de empleado, nombre de empleado, 
 nombre de cliente, número de cheque y total, 
 es decir, los clientes asociados a cada empleado.
 */
 
 SELECT 