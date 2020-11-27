#Ejemplo 3, Group By

#Total de ventas por producto
SELECT nombre, sum(precio) AS total
FROM articulo
GROUP BY nombre;

#Cuenta los Mas Vendidos
SELECT nombre, count(*) AS cantidad
FROM articulo
GROUP BY nombre
ORDER BY cantidad DESC;

#Minimo y maximo de una categoria
SELECT nombre, min(salario) AS menor, max(salario) AS mayor
FROM puesto
GROUP BY nombre;