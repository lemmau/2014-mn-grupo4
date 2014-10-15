create schema `dds_grupo4_entrega8` ;

use dds_grupo4_entrega8;

/*
DROP schema `dds_grupo4_entrega8` ;
DROP table jugadores;
DROP table equipos;
DROP table formacion;
DROP table formacion_jugador;
DROP table partidos;
DROP table infracciones;
*/

CREATE TABLE Equipos (
rid int AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre varchar(50) NOT NULL
);

CREATE TABLE Formacion (
rid int AUTO_INCREMENT NOT NULL PRIMARY KEY,
equipo_rid int NOT NULL,
goles int,
constraint formacion_equipo foreign key (equipo_rid) references equipos (rid)
);

CREATE TABLE Partidos (
rid int AUTO_INCREMENT NOT NULL PRIMARY KEY,
fecha DATE NOT NULL,
formacionLocal_rid int NOT NULL,
formacionVisitante_rid int NOT NULL,
constraint formacion_local foreign key (formacionLocal_rid) references formacion (rid),
constraint formacion_visitante foreign key (formacionVisitante_rid) references formacion (rid)
);

CREATE TABLE Jugadores (
rid int AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre varchar(50) NOT NULL,
edad int NOT NULL,
handicap int NOT NULL,
reemplazante_rid int NULL,	-- DADO que puede no tenerlo
constraint jugadores_jugadores foreign key (reemplazante_rid) references jugadores (rid)
);

CREATE TABLE Formacion_Jugador (
rid int AUTO_INCREMENT NOT NULL PRIMARY KEY,
formacion_rid int NOT NULL,
jugador_rid int NOT NULL,
estado INT NOT NULL,
-- status TINYINT(1),	-- Baja logica -> true (1) / false (0)
constraint formacion_jugador_formacion foreign key (formacion_rid) references formacion (rid),
constraint formacion_jugador_jugador foreign key (jugador_rid) references jugadores (rid)
);

CREATE TABLE Infracciones (
rid int AUTO_INCREMENT NOT NULL PRIMARY KEY,
descripcion varchar(100) NULL,
fecha DATE NOT NULL,
jugador_rid int NOT NULL,
partido_rid int NULL,
constraint infracciones_jugador foreign key (jugador_rid) references jugadores (rid),
constraint infracciones_partido foreign key (partido_rid) references partidos (rid)
);