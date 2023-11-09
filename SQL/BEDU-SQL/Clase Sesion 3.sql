show databases;
use tienda;

-- CLASE 3 - 6 DE JUNIO 2023

-- mayor y menor cantidad de ventas de un articulo
select clave, id_articulo, count(*) as cantidad
from venta
group by clave, id_articulo
order by cantidad desc;

-- mayor y menor cantidad de ventas de un articulo en una sola venta
select id_articulo, min(cantidad), max(cantidad)
from (select clave, id_articulo, count(*) as cantidad
	from venta
	group by clave, id_articulo
	order by cantidad desc) as subconsulta
group by id_articulo;

-- EJEMPLO 1 +++++++++++++++++++++++++++++++++++
show keys from venta;

-- ¿cual es el puesto de cada empleado? ignorar empleados sin puesto
select concat(e.nombre,' ' , apellido_paterno) as nombre_completo, p.nombre as puesto_empleado
from empleado as e
inner join puesto as p
on e.id_puesto=p.id_puesto; -- tambien podemos usar USING(id_puesto), depende del contexto

-- left join
select concat(e.nombre,' ' , apellido_paterno) as nombre_completo, p.nombre as puesto_empleado
from puesto as p
left join empleado as e
on e.id_puesto=p.id_puesto;
-- notamos que no hay puestos con personas 
-- importante, el lado de los joins , dependiendo lo que queramos (piensa en el diagrama de venn)

-- RIGH JOIN
select concat(e.nombre,' ' , apellido_paterno) as nombre_completo, p.nombre as puesto_empleado
from puesto as p
right join empleado as e
on e.id_puesto=p.id_puesto;
-- notamos que todos los empleados tienen un puesto

-- REPETICION DE LOS 10 MEJORES VENDEDORES DE CAFE O TE (RETO EXTRA SESION 2)
-- APLICANDO JOINS:
select concat(e.nombre,' ' , apellido_paterno) as nombre_completo, count(v.id_empleado) as ventas
from venta as v
join articulo as a -- es un inner join
on v.id_articulo=a.id_articulo
inner join empleado as e
on v.id_empleado=e.id_empleado
where (a.nombre like '%coffee%' or a.nombre like '%tea %')
group by v.id_empleado
order by ventas desc
;

-- RETO 1 +++++++++++++++++++++++++

-- ¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT clave, v.id_empleado, concat(nombre, ' ', apellido_paterno) as nombre_empleado
FROM venta as v
join empleado as e
on v.id_empleado=e.id_empleado;

-- ¿Cuál es el nombre de los artículos que se han vendido?
SELECT id_venta, v.id_articulo, a.nombre as nombre_articulo
FROM venta as v
join articulo as a
on v.id_articulo=a.id_articulo
order by id_venta;

-- ¿Cuál es el total de cada venta?
SELECT id_venta, a.nombre, precio, iva,(sum(precio + iva)) as total_venta
FROM venta as v
join articulo as a
on v.id_articulo=a.id_articulo
group by id_venta
order by id_venta;

SELECT v.clave, sum(precio + iva) as total_venta
FROM venta as v
join articulo as a
on a.id_articulo=v.id_articulo
group by clave;

SELECT clave, round(sum(a.precio+a.iva), 2) as total_venta
FROM venta v
JOIN articulo a
ON a.id_articulo = v.id_articulo
GROUP BY clave;
-- ntas
select*
from venta
join articulo;

-- ++++++++++++++++++++++++++++++++
-- VISTAS EJEMPLO 02
create view tickets_M614 as (
SELECT clave, fecha, concat_ws(' ',e.nombre, apellido_paterno, apellido_materno) as vendedor,
	a.nombre, round(precio+iva,2) as precio_total
from venta as v
join empleado as e
on v.id_empleado=e.id_empleado
join articulo as a
on v.id_articulo=a.id_articulo);

select clave, sum(precio_total) as total_compra from tickets_M614 group by clave;
select* from tickets_M614;

-- RETO 2 definir vistas

-- 1 Obtener el puesto de un empleado.
show tables;
-- luego lo pongo como vista
select concat_ws(' ',e.nombre, apellido_paterno, apellido_materno) as empleado, p.nombre as puesto
from empleado as e
join puesto as p
on e.id_puesto=p.id_puesto;

-- 2 Saber qué artículos ha vendido cada empleado.
select clave, a.nombre as articulo, concat_ws(' ',e.nombre, apellido_paterno, apellido_materno) as empleado
from venta as v
join articulo as a
on a.id_articulo=v.id_articulo
join empleado as e
on v.id_empleado=e.id_empleado
order by empleado;

-- 3 Saber qué puesto ha tenido más ventas.
select count(clave) as num_ventas, puesto
from (
select clave, concat_ws(' ',e.nombre, apellido_paterno, apellido_materno) as empleado, p.nombre as puesto
from venta  as v
join empleado as e
on v.id_empleado=e.id_empleado
join puesto as p
on e.id_puesto=p.id_puesto
) as vista3
group by puesto
order by num_ventas desc;

-- NOTA: las vistas puedo usarlas como subqueries
