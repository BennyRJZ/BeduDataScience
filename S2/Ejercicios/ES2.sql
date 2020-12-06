/*
Aplicar los conceptos adquiridos durante la sesión.
2. Requisitos 📋
MySQL Workbench instalado.
3. Desarrollo 🚀
Todas las consultas que realices deberás mantenerlas dentro del editor de textos de MySQL Workbench. Al finalizar, guarda este archivo, llendo al menú File > Save script.

Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre empiece con A.

Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo apellido termina con on.

Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena on.

Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyos nombres tienen seis letras e inician con G.

Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre no inicia con B.

Dentro de la tabla products, obten el código de producto y nombre de los productos cuyo código incluye la cadena _20.

Dentro de la tabla orderdetails, obten el total de cada orden.

Dentro de la tabla orders obten el número de órdenes por año.

Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.

Obten el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.

Obten el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.

Obten el nombre de aquellos clientes que no han hecho ninguna orden.

Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta.

Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.
*/
#1
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE 'A%';
#2
SELECT employeeNumber, lastName, firstName 
FROM employees
WHERE lastName LIKE '%on';
#3
SELECT employeeNumber,lastname,firstname 
FROM employees WHERE firstname LIKE '%on%';
#4
SELECT employeeNumber, lastName, firstName 
FROM employees
WHERE firstName LIKE 'G_____';
#5
SELECT employeeNumber, lastName, firstName 
FROM employees
WHERE firstName NOT LIKE 'B%';
#6
SELECT productCode, productName FROM products
WHERE productCode LIKE '%_20%';
#7
SELECT orderNumber, SUM(priceEach) FROM orderdetails
GROUP BY orderNumber;
#8
SELECT YEAR(orderDate), count(*)
FROM orders
GROUP BY YEAR(orderDate);
#9
select lastName,firstName from employees where officeCode IN 
(select officeCode from offices where country = 'USA');
#10
 SELECT customerNumber, checkNumber, amount FROM payments ORDER BY amount DESC LIMIT 1; 
#11
SELECT customerNumber, checkNumber, amount
FROM payments
WHERE amount > (SELECT avg(amount) FROM payments);

#12

SELECT customerName 
FROM customers
WHERE customerNumber NOT IN 
   (SELECT customerNumber
   FROM orders);
#13
SELECT max(quantityOrdered), min(quantityOrdered), avg(quantityOrdered)
FROM orderdetails;


#14
SELECT (SELECT state FROM customers WHERE customerNumber = o.customerNumber) AS state, count(*) AS num_orders 
FROM orders as o
GROUP BY state;