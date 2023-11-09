show databases;
use classicmodels;
show tables;

-- 2. obtén el apellido de todos los empleados.
select lastName
from employees;

-- 3. obtén el apellido, nombre y puesto de todos los empleados.
select lastName, firstName, jobTitle
from employees;

-- 4. obtén todos los datos de cada empleado.
select *
from employees;

-- 5. obtén el apellido, nombre y puesto de todos los empleados que tengan el puesto Sales Rep.
select lastName, firstName, jobTitle
from employees
where jobTitle = 'Sales Rep';

-- 6. obtén el apellido, nombre, puesto y código de oficina de todos los empleados 
-- que tengan el puesto Sales Rep y código de oficina 1.
select lastName, firstName, jobTitle, officeCode
from employees
where jobTitle = 'Sales Rep' and officeCode = '1';

-- 7. obtén el apellido, nombre, puesto y código de oficina de todos los empleados 
-- que tengan el puesto Sales Rep o código de oficina 1.
select lastName, firstName, jobTitle, officeCode
from employees
where jobTitle = 'Sales Rep' or officeCode = '1';

-- 8. obtén el apellido, nombre y código de oficina de todos los empleados 
-- que tenga código de oficina 1, 2 o 3.
select lastName, firstName, jobTitle, officeCode
from employees
where officeCode in (1,2,3);

-- 9. obten el apellido, nombre y puesto de todos los empleados que tengan un puesto distinto a Sales Rep.
select lastName, firstName, jobTitle
from employees
where not jobTitle = 'sales rep';

-- 10. obtén el apellido, nombre y código de oficina de todos los empleados cuyo código de oficina sea mayor a 5.
select lastName, firstName, officeCode
from employees
where officeCode > 5;

-- 11. obtén el apellido, nombre y código de oficina de todos los empleados cuyo cdigo de oficina sea menor o igual 4.
select lastName, firstName, officeCode
from employees
where officeCode <= 4;

-- 12. Dentro de la tabla customers, obtén el nombre, país y estado de todos los clientes cuyo país sea USA 
-- y cuyo estado sea CA.
select customerName, country, state
from customers
where country = 'USA' and state = 'CA';

-- 13. obtén el nombre, país, estado y límite de crédito de todos los clientes cuyo país sea, USA, cuyo 
-- estado sea CA y cuyo límite de crédito sea mayor a 100000.
select customerName, country, state, creditLimit
from customers
where country = 'USA' and state = 'CA' and creditLimit > '100000'
order by creditLimit ;

-- 14. obtén el nombre y país de todos los clientes cuyo país sea USA o France.
select customerName, country
from customers
where country = 'USA' or country = 'France';

-- 15. obtén el nombre, pais y límite de crédito de todos los clientes cuyo país sea USA o France 
-- y cuyo límite de crédito sea mayor a 100000. Para este ejercicio ten cuidado con los paréntesis.
select customerName, country, creditLimit
from customers
where country in ('USA','France') 
and creditLimit >'100000'
order by creditLimit;

-- 16. Dentro de la tabla offices, obtén el código de la oficina, ciudad, teléfono y país de aquellas oficinas 
-- que se encuentren en USA o France.
select officeCode, city, phone, country
from offices
where country in ('usa','france');

-- 17. obtén el código de la oficina, ciudad, teléfono y país de aquellas oficinas 
-- que no se encuentren en USA o France.
select officeCode, city, phone, country
from offices
where not country in ('usa','france');

-- 18. Dentro de la tabla orders, obtén el número de orden, número de cliente, estado y fecha de envío 
-- de todas las órdenes con el número 10165, 10287 o 10310.
select orderNumber, customerNumber, status, shippedDate
from orders
where ordernumber in ('10165','10287','10310');


-- 19. Dentro de la tabla customers, obtén el apellido de contacto y nombre de cada cliente 
-- y ordena los resultados por apellido de forma ascendente.
select contactlastname, customername
from customers
order by contactlastname asc;

-- 20. Dentro de la tabla customers, obtén el apellido de contacto y nombre de cada cliente 
-- y ordena los resultados por apellido de forma descendente.
select contactlastname, customername
from customers
order by contactlastname desc;

-- 21. Dentro de la tabla customers, obtén el apellido y nombre de cada cliente 
-- y ordena los resultados por apellido de forma descendente y luego por nombre de forma ascendente.
select contactlastname, customername
from customers
order by contactlastname desc;

select contactlastname, customername
from customers
order by customername asc;

-- 22. Dentro de la tabla customers, obtén el número de cliente, nombre de cliente 
-- y el límite de crédito de los cinco clientes con el límite de crédito más alto (top 5).
select customernumber, customername, creditlimit
from customers
order by creditlimit desc
limit 5;

-- 23. Dentro de la tabla customers, obtén el número de cliente, nombre de cliente 
-- y el límite de crédito de los cinco clientes con el límite de crédito más bajo diferente de 0.
select customernumber, customername, creditlimit
from customers
where not creditlimit='0.0'
order by creditlimit asc
limit 5;









