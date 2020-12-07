USE classicmodels;

-- Obtén la cantidad de productos de cada orden.
SELECT o.orderNumber, sum(quantityOrdered)
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;

-- Obten el número de orden, estado y costo total de cada orden.
SELECT o.orderNumber, o.status, sum(quantityOrdered * priceEach) total
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber, o.status;

-- Obten el número de orden, fecha de orden, línea de orden, 
-- nombre del producto, cantidad ordenada y precio de cada pieza.
SELECT o.orderNumber, requiredDate, orderLineNumber, p.productName, quantityOrdered, priceEach
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
JOIN products p
  ON od.productCode = p.productCode;
  
-- Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) 
-- y precio de cada pieza.

SELECT o.orderNumber, p.productName, MSRP, priceEach
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
JOIN products p
  ON od.productCode = p.productCode;
  
-- Obtén el número de cliente, nombre de cliente, número de orden y estado de cada orden 
-- hecha por cada cliente. 
SELECT c.customerNumber, customerName, orderNumber, status
FROM customers c
LEFT JOIN orders o
  ON c.customerNumber = o.customerNumber;
  
-- Obtén los clientes que no tienen una orden asociada.
SELECT c.customerNumber, customerName
FROM customers c
LEFT JOIN orders o
  ON c.customerNumber = o.customerNumber
WHERE orderNumber IS NULL;

-- Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque
-- y total, es decir, los clientes asociados a cada empleado.
SELECT lastName, firstName, customerName, checkNumber, amount
FROM employees e
LEFT JOIN customers c 
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments ON 
    payments.customerNumber = c.customerNumber
ORDER BY customerName, checkNumber;

-- Repite los ejercicios 5 a 7 usando RIGHT JOIN. 
SELECT c.customerNumber, customerName, orderNumber, status
FROM customers c
RIGHT JOIN orders o
  ON c.customerNumber = o.customerNumber;
  
SELECT c.customerNumber, customerName
FROM customers c
RIGHT JOIN orders o
  ON c.customerNumber = o.customerNumber
WHERE orderNumber IS NULL;
  
SELECT lastName, firstName, customerName, checkNumber, amount
FROM employees e
RIGHT JOIN customers c 
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments ON 
    payments.customerNumber = c.customerNumber
ORDER BY customerName, checkNumber;
