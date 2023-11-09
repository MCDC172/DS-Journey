show databases;
use tienda;

-- empleados que tengan M en su nombre
select *
from empleado
where nombre like '%M%';

-- empleados que su nombre inicia con m
select *
from empleado
where nombre like 'M%';

-- nombre que termina con a
select *
from empleado
where nombre like '%a';

-- que empiece con m y termine con a
select *
from empleado
where nombre like 'M%a';

-- cadena con dos caracteres enmedio de m y a
select *
from empleado
where nombre like 'm__a';

-- distincion entre mayuscula y minuscula
select *
from empleado
where nombre like binary '%A';

-- RETO1

-- ¿Qué artículos incluyen la palabra Pasta en su nombre?
select *
from articulo
where nombre like '%pasta%';

-- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
select *
from articulo
where nombre like '%cannelloni%';

-- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
select *
from articulo
where nombre like '%-%';

-- ¿Qué productos tienen 7 caracteres de longitud?
select *
from articulo
where nombre like '_______';

-- ¿Qué artículos tienen mililitros (ml) escrito en minúsculas?
select *
from articulo
where nombre like binary '%ml%';

-- ¿Qué artículos tienen mililitros (Ml) con una mayúscula?
select *
from articulo
where nombre like binary '%Ml%';

/* Al buscar artículos con mililitros, 
notarás que algunos artículos que no están expresando mililitros, 
se pueden colar. Revisa la documentación de Regex y responde, 
¿es posible filtrar esos datos?.
pusieron la respuesta tengo ss*/

-- Ej 2
select (1+7)*5;

-- promedio
select avg(precio) from articulo;

-- numero de registros 
select count(*) 
from articulo;

-- maximos y minimos
select max(precio)
from articulo;

-- suma
select sum(precio) 
from articulo;

-- limitar la salida de decimales
select round(sum(precio),2) 
from articulo;

-- RETO 2
-- ¿Cuál es el promedio de salario de los puestos?
select avg(salario)
from puesto;

-- ¿Cuántos artículos incluyen la palabra Coffee o Tea en su nombre?
select count(nombre)
from articulo
where nombre like '%coffee%' or nombre like '%tea%';
-- otra
select count(*) as coffee_tea from articulo 
where nombre regexp '^(.*)(Coffee|Tea)(.*)$';

-- ¿Cuál es el salario mínimo y máximo?
select max(salario), min(salario)
from puesto;

-- ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
select sum(salario)
from puesto
order by id_puesto desc 
limit 5;
-- no se usaba limit aqui va una respuesta correcta
select sum(salario) as sum_salario 
from puesto 
where id_puesto > 995;
-- tambien se pueden usar subconsultas

-- ¿Cual es precio promedio de un producto? Considerando el IVA.
select sum(precio), sum(iva)
from articulo;
select avg(3512730.939 + 578460.329);
-- aqui va la buena
select avg(precio + iva) from articulo;

-- EJE 3 groupby

select nombre, avg(precio)
from articulo
group by nombre;

select nombre, count(*) as cantidad
from articulo
group by nombre
order by cantidad desc;

-- diferencia salarial entre los empleados de la tienda
select nombre, min(salario) as menor, max(salario) as mayor
from puesto
group by nombre;

-- RETO 3

-- Cuántos registros hay por cada uno de los puestos?
select nombre, count(nombre) as cantidad
from puesto
group by nombre;

-- ¿Cuánto dinero se paga en total por puesto?
select nombre, round(sum(salario),2)
from puesto
group by nombre;

-- ¿Cuál es el número total de ventas por vendedor? 
-- Ordénalos de mayor a menor número de ventas.
select id_empleado, count(id_venta) as cantidad
from venta
group by id_empleado
order by cantidad desc;

select *
from venta;
-- ¿Cuál es el número total de ventas por artículo? Ordénalos de menor a mayor.
select count(id_venta), id_articulo
from venta
group by id_articulo
order by count(id_venta) asc;

-- ¿Cuales son los 10 puestos de trabajo con mayor diferencia entre su salario máximo y mínimo?
select *
from puesto;
select nombre, round(max(salario)-min(salario),2) as difsal
from puesto
group by nombre
order by difsal desc;

-- ej 4

-- nombre de empleados que sean junior executive
-- de mas facil a ccomplreto

-- nombre de empleados con puesto junior executive
select id_puesto from puesto where nombre = 'junior executive';

-- subquery con where, trae elementos de otra tabla
select *
from empleado
where id_puesto in (select id_puesto from puesto where nombre = 'junior executive') ;

-- otro ejemplo con subquery con select
select * from puesto;
select * from empleado;

select nombre, apellido_paterno, 
	(select salario from puesto where puesto.id_puesto = empleado.id_puesto) as salario
from empleado;

-- reto 4 (hacer de tarea)
use tienda;
show tables;


show databases;
use tienda;
show tables;

-- ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
select *
from puesto
order by salario asc;
-- dado que el salario minimo es superior a los 10,000 ; procedo a reformular la pregunta
-- ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $11,000?
-- primer query
select id_puesto, salario from puesto where salario < '11000' order by id_puesto asc;
-- meterlo al subquery
select id_puesto, nombre
from empleado
where id_puesto in (select id_puesto from puesto where salario < '11000' order by salario asc)
order by id_puesto;

-- quiero otro donde me escriba el salario y el nombre
select nombre, apellido_paterno, 
	(select salario from puesto where puesto.id_puesto = empleado.id_puesto) as salario
from empleado
where id_puesto in (select id_puesto from puesto where salario < '11000' order by salario asc)
order by id_puesto;

/* nota
tengo el resultado correcto en dos formas diferentes
la primera solo me da el nombre y el pueesto. y si se cumple <11k
la segunda, da nombre y salario (asi es mas visual el <11k)

nota 2: cuando se pone el subquery como parte de un SELECT , en la parte de
where se coloca el a.algo=b.algo pra hacer la relacion entre tablas (ab) y obtener el elemento (algo)
y al final del parentesis un AS para el alias 
*/

-- ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
show tables;
-- tblas venta y empleado
-- 1 contar las ventas por empleado, 2 poner los datos del empleado 
select count(id_articulo) as num_ventas, id_empleado, 
	(select nombre from empleado where empleado.id_empleado=venta.id_empleado) as nombre
from venta
group by id_empleado
order by num_ventas desc;
use tienda;
-- ¿Cuál es el nombre del puesto de cada empleado?
-- empleado y puesto
select nombre, (select nombre from puesto where puesto.id_puesto=empleado.id_puesto) as puesto
from empleado
order by nombre;

-- RETO EXTRA
-- ¿Quienes son los 10 afortunados empleados que viajarán a Acapulco?
-- definir articulos con cafe o te en su nombre
show tables;
select id_articulo, nombre
from articulo
where nombre like '%coffee%' or nombre like '%Tea%';
-- ventas de estos productos
select id_empleado, id_articulo
from venta
where id_articulo in (select id_articulo from articulo 
		where nombre like '%coffee%' or nombre like '%Tea%')
order by id_empleado;
-- a simple vista se nota que ningun empleado vendio mas de dos articulos con estas palabras
-- asi que ninguno se va de vacaciones. 
select count(id_empleado)
from (select id_empleado, id_articulo
from venta
where id_articulo in (select id_articulo from articulo 
		where nombre like '%coffee%' or nombre like '%Tea%')
order by id_empleado) as uno
group by id_empleado;



