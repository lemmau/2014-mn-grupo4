-- equipos
insert into equipos
(nombre)
values ('River Plate');

insert into equipos 
(nombre)
values ('Boca Juniors');

insert into equipos
(nombre)
values ('Independiente');

insert into equipos
(nombre)
values ('Olimpo');

-- tipo inscripciones
/*
insert into tipo_inscripcion
(tipo) values ('estandar');

insert into tipo_inscripcion
(tipo) values ('condicional');
*/
insert into tipo_inscripcion
(tipo) values ('solidario');

select id into @tipo_solidario from tipo_inscripcion where tipo = 'solidario';

-- formaciones
select id into @equiporiver from equipos where nombre = 'River Plate';

insert into formacion
(equipo_id,goles)
values (@equiporiver,4);

select id into @equipoboca from equipos where nombre = 'Boca Juniors';

insert into formacion
(equipo_id,goles)
values (@equipoboca,0);

-- jugadores + formaciones (river)
select f.id into @formacionid from formacion f, equipos e where f.equipo_id = e.id and e.nombre = 'River Plate';

insert into usuarios
(nombre,edad)
values ('Julio Chiarini',28);

select id into @jugadoid from usuarios where nombre = 'Julio Chiarini';

insert into jugadores
(equipo_id, tipo_inscripcion_id, handicap, usuario_id)
values
(@equiporiver, @tipo_solidario, 6, @jugadoid);

insert into formacion_jugador
(formacion_id, jugador_id, estado)
values (@formacionid, @jugadoid, 1);

insert into usuarios
(nombre,edad)
values ('Ramiro Funes Mori',26);

select id into @jugadoid from usuarios where nombre = 'Ramiro Funes Mori';

insert into jugadores
(equipo_id, tipo_inscripcion_id, handicap, usuario_id)
values
(@equiporiver, @tipo_solidario, 6, @jugadoid);

insert into formacion_jugador
(formacion_id, jugador_id, estado)
values (@formacionid, @jugadoid, 1);

insert into usuarios
(nombre,edad)
values ('Emanuel Mammana',28);

select id into @jugadoid from usuarios where nombre = 'Emanuel Mammana';

insert into jugadores
(equipo_id, tipo_inscripcion_id, handicap, usuario_id)
values
(@equiporiver, @tipo_solidario, 6, @jugadoid);

insert into formacion_jugador
(formacion_id, jugador_id, estado)
values (@formacionid, @jugadoid, 1);
--
insert into usuarios
(nombre,edad)
values ('German Alejo Pezzella',29);

select id into @jugadoid from usuarios where nombre = 'German Alejo Pezzella';

insert into jugadores
(equipo_id, tipo_inscripcion_id, handicap, usuario_id)
values
(@equiporiver, @tipo_solidario, 6, @jugadoid);

insert into formacion_jugador
(formacion_id, jugador_id, estado)
values (@formacionid, @jugadoid, 1);
--
insert into usuarios
(nombre,edad)
values ('Matias Kranevitter',30);

select id into @jugadoid from usuarios where nombre = 'Matias Kranevitter';

insert into jugadores
(equipo_id, tipo_inscripcion_id, handicap, usuario_id)
values
(@equiporiver, @tipo_solidario, 6, @jugadoid);

insert into formacion_jugador
(formacion_id, jugador_id, estado)
values (@formacionid, @jugadoid, 1);
--
insert into usuarios
(nombre,edad)
values ('Fernando Cavenaghi',45);

select id into @jugadoid from usuarios where nombre = 'Fernando Cavenaghi';

insert into jugadores
(equipo_id, tipo_inscripcion_id, handicap, usuario_id)
values
(@equiporiver, @tipo_solidario, 6, @jugadoid);

insert into formacion_jugador
(formacion_id, jugador_id, estado)
values (@formacionid, @jugadoid, 1);
--
insert into usuarios
(nombre,edad)
values ('Ariel Rojas',25);

select id into @jugadoid from usuarios where nombre = 'Ariel Rojas';

insert into jugadores
(equipo_id, tipo_inscripcion_id, handicap, usuario_id)
values
(@equiporiver, @tipo_solidario, 6, @jugadoid);

insert into formacion_jugador
(formacion_id, jugador_id, estado)
values (@formacionid, @jugadoid, 1);
/*
insert into usuarios
(nombre,edad)
values ('Leonel Vangioni');

insert into jugadores
(nombre, handicap, edad, reemplazante_id)
values ('Leonardo Piscullichi', 6, 27,NULL);

insert into jugadores
(nombre, handicap, edad, reemplazante_id)
values ('Rodrigo Mora', 6, 27,NULL);

insert into jugadores
(nombre, handicap, edad, reemplazante_id)
values ('Carlos Sánchez', 6, 26,NULL);

insert into jugadores
(nombre, handicap, edad, reemplazante_id)
values ('Giovani Simeone', 6, 21,NULL);
*/

-- jugadores boca 
insert into usuarios
(nombre,edad)
values ('Andrés Chavez',22);

select id into @jugadoid from usuarios where nombre = 'Andrés Chavez';

insert into jugadores
(equipo_id, tipo_inscripcion_id, handicap, usuario_id)
values
(@equipoboca, @tipo_solidario, 3, @jugadoid);
--
insert into usuarios
(nombre,edad)
values ('Emmanuel Gigliotti',23);

select id into @jugadoid from usuarios where nombre = 'Emmanuel Gigliotti';

insert into jugadores
(equipo_id, tipo_inscripcion_id, handicap, usuario_id)
values
(@equipoboca, @tipo_solidario, 3, @jugadoid);
--
insert into usuarios
(nombre,edad)
values ('Emmanuel Insúa',23);

select id into @jugadoid from usuarios where nombre = 'Emmanuel Insúa';

insert into jugadores
(equipo_id, tipo_inscripcion_id, handicap, usuario_id)
values
(@equipoboca, @tipo_solidario, 3, @jugadoid);
--
insert into usuarios
(nombre,edad)
values ('Jonathan Calleri',21);

select id into @jugadoid from usuarios where nombre = 'Jonathan Calleri';

insert into jugadores
(equipo_id, tipo_inscripcion_id, handicap, usuario_id)
values
(@equipoboca, @tipo_solidario, 3, @jugadoid);
--
insert into usuarios
(nombre,edad)
values ('Agustín Orion',44);

select id into @jugadoid from usuarios where nombre = 'Agustín Orion';

insert into jugadores
(equipo_id, tipo_inscripcion_id, handicap, usuario_id)
values
(@equipoboca, @tipo_solidario, 3, @jugadoid);

-- amigo reemplazante de jugador
insert into usuarios (nombre, edad) values ('Cachito',66);

select id into @usuario_amigo_id from usuarios where nombre = 'Cachito';

insert into amigos_jugador (usuario_id) values (@usuario_amigo_id);

select a.id into @cachito_id from amigos_jugador a, usuarios u where u.id = a.usuario_id and u.nombre = 'Cachito';

-- infracciones
select u.id into @jugadoid 
from usuarios u,jugadores f
where f.usuario_id = u.id
and u.nombre = 'Emmanuel Insúa';

insert into infracciones
(jugador_id, fecha)
values (@jugadoid,'2014-10-04');

insert into infracciones
(jugador_id, fecha)
values (@jugadoid,'2014-10-01');

insert into infracciones
(jugador_id, fecha)
values (@jugadoid,'2014-10-12');

insert into infracciones
(jugador_id, fecha)
values (@jugadoid,'2014-10-08');

update jugadores set amigo_jugador_id = @cachito_id where id = @jugadoid;

select u.id into @jugadoid 
from usuarios u,jugadores f
where f.usuario_id = u.id
and u.nombre = 'Ramiro Funes Mori';

insert into infracciones
(jugador_id, fecha)
values (@jugadoid,'2014-10-04');

insert into infracciones
(jugador_id, fecha)
values (@jugadoid,'2014-10-01');

insert into infracciones
(jugador_id, fecha)
values (@jugadoid,'2014-10-12');

insert into infracciones
(jugador_id, fecha)
values (@jugadoid,'2014-10-08');

select u.id into @jugadoid 
from usuarios u,jugadores f
where f.usuario_id = u.id
and u.nombre =  'Agustín Orion';

insert into infracciones
(jugador_id, fecha)
values (@jugadoid,'2014-10-04');

insert into infracciones
(jugador_id, fecha)
values (@jugadoid,'2014-10-01');

insert into infracciones
(jugador_id, fecha)
values (@jugadoid,'2014-10-12');
