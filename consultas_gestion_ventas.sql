USE VENTAS;

-- Consultas sobre una tabla

-- 1) Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, 
--    mostrando en primer lugar los pedidos más recientes.

SELECT * FROM PEDIDO ORDER BY FECHA DESC;

-- 2) Devuelve todos los datos de los dos pedidos de mayor valor.

SELECT * FROM PEDIDO ORDER BY CANTIDAD DESC LIMIT 2;

-- 3) Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe 
--    mostrar identificadores que estén repetidos.

SELECT CLIENTE FROM PEDIDO GROUP BY CLIENTE;

-- 4) Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.

SELECT * FROM PEDIDO WHERE FECHA LIKE "2017%" AND CANTIDAD > 500;

-- 5) Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.

SELECT NOMBRE, APELLIDO, APELLIDO2, COMISION FROM COMERCIAL WHERE COMISION BETWEEN 0.05 AND 0.11;

-- 6) Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.

SELECT COMISION FROM COMERCIAL ORDER BY COMISION DESC LIMIT 1;

-- 7) Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. 
--    El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

SELECT ID, NOMBRE, APELLIDO FROM CLIENTE WHERE APELLIDO2 IS NOT NULL ORDER BY APELLIDO, APELLIDO2, NOMBRE;

-- 8) Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan 
--    por P. El listado deberá estar ordenado alfabéticamente.

SELECT * FROM CLIENTE WHERE NOMBRE LIKE "A%n" OR NOMBRE LIKE "P%";

-- 9) Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.

SELECT * FROM CLIENTE WHERE NOMBRE NOT LIKE "A%";

-- 10) Devuelve un listado con los nombres de los comerciales que terminan por el o por o. Tenga en cuenta que se deberán eliminar 
--     los nombres repetidos.

SELECT NOMBRE FROM COMERCIAL WHERE NOMBRE NOT LIKE "A%";

-- 10) Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar 
--     los nombres repetidos.

SELECT NOMBRE FROM COMERCIAL WHERE NOMBRE LIKE "%el" OR NOMBRE LIKE "%o" GROUP BY NOMBRE;

-- Consultas multitabla (Composición interna)

-- 1) Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. 
--    El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

SELECT C.ID, C.NOMBRE, C.APELLIDO, C.APELLIDO2 FROM CLIENTE C INNER JOIN PEDIDO P ON C.ID = P.CLIENTE GROUP BY C.ID;

-- 2) Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos 
--    de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

SELECT * FROM CLIENTE C INNER JOIN PEDIDO P ON C.ID = P.CLIENTE ORDER BY C.NOMBRE, C.APELLIDO, C.APELLIDO2;

-- 3) Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los 
--    datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.

SELECT * FROM COMERCIAL C INNER JOIN PEDIDO P ON C.ID = P.COMERCIAL WHERE P.COMERCIAL IS NOT NULL ORDER BY C.NOMBRE, C.APELLIDO, C.APELLIDO2;

-- 4) Devuelve un listado que muestre todos los clientes, con todos los pedidos que han  realizado y con los datos de los comerciales 
--    asociados a cada pedido.

SELECT * FROM CLIENTE C INNER JOIN PEDIDO P ON C.ID = P.CLIENTE INNER JOIN COMERCIAL CO ON CO.ID = P.COMERCIAL;

-- 5) Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.

SELECT C.* FROM CLIENTE C INNER JOIN PEDIDO P ON C.ID = P.CLIENTE WHERE YEAR(P.FECHA) = 2017 AND CANTIDAD BETWEEN 300 AND 1000;

-- 6) Devuelve el nombre y los apellidos de todos los comerciales que han participado en algún pedido realizado por 
--    María Santana Moreno.

SELECT CO.NOMBRE, CO.APELLIDO, CO.APELLIDO2 FROM CLIENTE C INNER JOIN PEDIDO P ON P.CLIENTE = C.ID INNER JOIN COMERCIAL CO ON P.COMERCIAL = CO.ID
-- WHERE CONCAT(C.NOMBRE, " ", C.APELLIDO, " ", C.APELLIDO2) IN ("María Santana Moreno");
WHERE C.NOMBRE = "Maria" AND C.APELLIDO = "Santana" AND C.APELLIDO2 = "Moreno" GROUP BY CONCAT(C.NOMBRE, " ", C.APELLIDO, " ", C.APELLIDO2);

-- 7) Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.

SELECT C.NOMBRE, C.APELLIDO, C.APELLIDO2 
FROM CLIENTE C INNER JOIN PEDIDO P ON P.CLIENTE = C.ID INNER JOIN COMERCIAL CO ON P.COMERCIAL = CO.ID
-- WHERE CONCAT(CO.NOMBRE, " ", CO.APELLIDO, " ", CO.APELLIDO2) IN ("Daniel Sáez Vega");
WHERE CO.NOMBRE = "Daniel" AND CO.APELLIDO = "Saez" AND CO.APELLIDO2 = "Vega" 
GROUP BY CONCAT(C.NOMBRE, " ", C.APELLIDO, " ", C.APELLIDO2);

-- Consultas multitabla (Composición externa)

-- Consultas resumen

-- 8) Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente 
--    puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para
--    cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y 
--    el valor de la cantidad.

SELECT C.ID, C.NOMBRE, C.APELLIDO, C.APELLIDO2, P.FECHA, P.CANTIDAD FROM PEDIDO P INNER JOIN CLIENTE C ON P.CLIENTE = C.ID
WHERE P.CANTIDAD IN (SELECT MAX(CANTIDAD) FROM PEDIDO P INNER JOIN CLIENTE C ON P.CLIENTE = C.ID GROUP BY P.FECHA, C.ID) ORDER BY P.ID;



