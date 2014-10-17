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
DROP table Calificaciones;
DROP table usuarios;
DROP table admin;
DROP table amigos_jugador;
DROP table logBajaJugadorPartido;
DROP table motivoBajaJugador;
DROP table tipo_inscripcion;
DROP table jugadores_del_partido;
*/

CREATE TABLE Equipos (
id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre varchar(50) NOT NULL
);

CREATE TABLE Formacion (
id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
equipo_id int NOT NULL,
goles int,
constraint formacion_equipo foreign key (equipo_id) references equipos (id)
);

CREATE TABLE Usuarios (
id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre varchar(50) NOT NULL,
apellido varchar(50) NULL,
edad int NULL,
mail varchar(50) NULL
);

CREATE TABLE Tipo_Inscripcion (
id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
tipo varchar(50)
);

CREATE TABLE Admin (
id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
usuario_id int NOT NULL,
constraint admin_usuario foreign key (usuario_id) references usuarios (id)
);

CREATE TABLE Amigos_Jugador (
id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
usuario_id int NOT NULL,
constraint amigos_jugador_usuario foreign key (usuario_id) references usuarios (id)
);

CREATE TABLE Jugadores (
id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
equipo_id int NOT NULL,
usuario_id int NOT NULL,
amigo_jugador_id int NULL,
tipo_inscripcion_id int NOT NULL,
handicap int NOT NULL,
constraint jugadores_equipo foreign key (equipo_id) references equipos (id),
constraint jugadores_usuario foreign key (usuario_id) references usuarios (id),
constraint jugadores_amigos_ foreign key (amigo_jugador_id) references amigos_jugador (id)
);

CREATE TABLE Formacion_Jugador (
id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
formacion_id int NOT NULL,
jugador_id int NOT NULL,
estado INT NOT NULL, 
-- status TINYINT(1),	-- Baja logica -> true (1) / false (0)
constraint formacion_jugador_formacion foreign key (formacion_id) references formacion (id),
constraint formacion_jugador_jugador foreign key (jugador_id) references jugadores (id)
);

CREATE TABLE Partidos (
id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
admin_id int NOT NULL,
fecha DATE NOT NULL,
confirmado TINYINT NOT NULL,
formacionLocal_id int NOT NULL,
formacionVisitante_id int NOT NULL,
constraint formacion_local foreign key (formacionLocal_id) references formacion (id),
constraint formacion_visitante foreign key (formacionVisitante_id) references formacion (id),
constraint partidos_administrador foreign key (admin_id) references admin (id)
);

CREATE TABLE Jugadores_Del_Partido (
id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
jugador_id int NOT NULL,
partido_id int NOT NULL,
constraint jugadores_jugador foreign key (jugador_id) references jugadores (id),
constraint jugadores_partido foreign key (partido_id) references partidos (id)
);

CREATE TABLE Infracciones (
id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
descripcion varchar(100) NULL,
fecha DATE NOT NULL,
jugador_id int NOT NULL,
constraint infracciones_jugador foreign key (jugador_id) references jugadores (id)
-- partido_id int NOT NULL,
-- constraint infracciones_partido foreign key (partido_id) references partidos (id)
);

CREATE TABLE Calificaciones (
id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
critica varchar(100) NULL,
nota int NOT NULL,
jugador_id int NOT NULL,
partido_id int NOT NULL,
constraint calificaciones_jugador foreign key (jugador_id) references jugadores (id),
constraint calificaciones_partido foreign key (partido_id) references partidos (id)
);

CREATE TABLE motivoBajaJugador (
id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
motivo varchar(50)
);

CREATE TABLE logBajaJugadorPartido (
id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
jugador_id int NOT NULL,
partido_id int NOT NULL,
motivoBajaJugador_id int NOT NULL,
fecha date NOT NULL,
ofreceReemplazo tinyint NOT NULL,
constraint log_jugador foreign key (jugador_id) references jugadores (id),
constraint log_partido foreign key (partido_id) references partidos (id),
constraint log_motivo foreign key (motivoBajaJugador_id) references motivoBajaJugador (id)
);

