-- CLASE 04 

-- EJEMPLO 01 ... CREAR BD
create database if not exists maricruz_db;
-- BORRAR DB
drop database if exists maricruz_db;

use maricruz_db;
-- EJEMPLO 02 CREACION DE TABLAS 
CREATE TABLE users (
	id_users int primary key,
	genero varchar(1),
    edad int,
    ocupacion int,
    zip_code varchar(20)
    );
-- para borrar tablas
drop table movies;

-- RETO 01

/*1.  Definir los campos y tipos de datos para la tabla movies haciendo uso 
de los archivos movies.dat y README.

*/
-- 2. Crear la tabla movies (recuerda usar el mismo nombre del archivo sin 
-- la extensión para vincular nombres de tablas con archivos).
create table movies (
id_movie int primary key,
title varchar(200),
genre varchar(80)
);
/* 3. Definir los campos y tipos de datos para la tabla ratings haciendo uso 
de los archivos ratings.dat y README.

*/
-- 4. Crear la tabla ratings (recuerda usar el mismo nombre del archivo sin la 
-- extensión para vincular nombres de tablas con archivos)
create table ratings (
	user_id int,
    movie_id int,
    rating int,
    time_stamp timestamp,
    foreign key (user_id) references users(id_users),
    foreign key (movie_id) references movies(id_movie)
    );

select * from movies;