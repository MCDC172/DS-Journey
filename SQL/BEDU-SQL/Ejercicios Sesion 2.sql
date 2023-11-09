-- EJERCICIOS SESION 2

/* 1. Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de todos los empleados 
cuyo nombre empiece con A. */
show databases;
use classicmodels;
show tables;	
select employeeNumber, lastname, firstname
from employees
where firstname like 'A%';

/* 2. Dentro de la tabla employees, obtén el número de empleado, apellido y nombre 
de todos los empleados cuyo apellido termina con on.  */
select employeenumber,lastname, firstname
from employees
where lastname like '%on';

/*3. Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de 
todos los empleados cuyo nombre incluye la cadena on.*/
select employeenumber,lastname, firstname
from employees
where firstname like '%on%';

/*4. Dentro de la tabla employees, obtén el número de empleado, apellido y nombre 
de todos los empleados cuyos nombres tienen seis letras e inician con G.*/
select employeenumber,lastname, firstname
from employees
where firstname like 'G_____';

/*5. Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de 
todos los empleados cuyo nombre no inicia con B.*/
select employeenumber,lastname, firstname
from employees
where firstname not like 'b%'
order by firstname;

/*6. Dentro de la tabla products, obtén el código de producto y nombre de los 
productos cuyo código incluye la cadena _20.*/
select productcode, productname
from products
where productcode like '%_20%';

/*7. Dentro de la tabla orderdetails, obtén el total de cada orden.*/
select sum(quantityordered * priceeach) as total, ordernumber
from orderdetails
group by ordernumber
order by ordernumber;

/*8. Dentro de la tabla orders obtén el número de órdenes por año.*/
SELECT year(orderdate) as anio, count(ordernumber) as ordenes_totales
FROM orders
group by anio;

/* 9. Obtén el apellido y nombre de los empleados cuya oficina está ubicada en USA.*/
-- officecode en employees.
select officecode
from offices
where country = 'USA' ;

SELECT 
    lastname, firstname, officecode
FROM
    employees
WHERE
    officecode IN (SELECT 
            officecode
        FROM
            offices
        WHERE
            country = 'USA');

/*10. Obtén el número de cliente, número de cheque y cantidad 
del cliente que ha realizado el pago más alto.*/
select customernumber, checknumber, amount
from payments 
order by amount desc
limit 1  ;

/*11. Obtén el número de cliente, número de cheque y cantidad 
de aquellos clientes cuyo pago es más alto que el promedio.*/
select avg(amount)
from payments;
select customernumber, checknumber, amount
from payments
where amount > (select avg(amount) from payments)
order by amount asc;

/*12 Obtén el nombre de aquellos clientes que no han hecho ninguna orden.*/
select customername 
from customers
where customernumber not in (select customernumber from orders);

/*13 Obtén el máximo, mínimo y promedio del número de productos en las órdenes de venta.*/
select max(quantityordered) as max, min(quantityordered) as min, avg(quantityordered) as promedio, productcode
from orderdetails
group by productcode;

/*14 Dentro de la tabla orders, Obtén el número de órdenes que hay por cada estado.*/
select count(ordernumber) as numero_ordenes, (select state from customers where customers.customernumber=orders.customernumber) as estado
from orders
group by estado
order by numero_ordenes;

/*FIN*/