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

-- formaciones
select rid into @equiporid from equipos where nombre = 'River Plate';

insert into formacion
(equipo_rid,goles)
values (@equiporid,4);

select rid into @equiporid from equipos where nombre = 'Boca Juniors';

insert into formacion
(equipo_rid,goles)
values (@equiporid,0);

-- jugadores + formaciones (river)
select f.rid into @formacionrid from formacion f, equipos e where f.equipo_rid = e.rid and e.nombre = 'River Plate';

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Julio Chiarini', 6, 32, NULL);

select rid into @jugadorrid from jugadores where nombre = 'Julio Chiarini';

insert into formacion_jugador
(formacion_rid, jugador_rid, estado)
values (@formacionrid, @jugadorrid, 1);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Marcelo Barovero', 6, 32, @jugadorrid);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Ramiro Funes Mori', 6, 24, NULL);

select rid into @jugadorrid from jugadores where nombre = 'Ramiro Funes Mori';

insert into formacion_jugador
(formacion_rid, jugador_rid, estado)
values (@formacionrid, @jugadorrid, 1);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Eder Alvarez Balanta', 6, 34, @jugadorrid);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Emanuel Mammana', 6, 22, NULL);

select rid into @jugadorrid from jugadores where nombre = 'Emanuel Mammana';

insert into formacion_jugador
(formacion_rid, jugador_rid, estado)
values (@formacionrid, @jugadorrid, 1);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Jonatan Maidana', 6, 27, @jugadorrid);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('German Alejo Pezzella', 6, 24, NULL);

select rid into @jugadorrid from jugadores where nombre = 'German Alejo Pezzella';

insert into formacion_jugador
(formacion_rid, jugador_rid, estado)
values (@formacionrid, @jugadorrid, 1);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Gabriel Mercado', 6, 26, @jugadorrid);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Matias Kranevitter', 6, 24, NULL);

select rid into @jugadorrid from jugadores where nombre = 'Matias Kranevitter';

insert into formacion_jugador
(formacion_rid, jugador_rid, estado)
values (@formacionrid, @jugadorrid, 1);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Leonardo Ponzio', 6, 30, @jugadorrid);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Fernando Cavenaghi', 6, 34, NULL);

select rid into @jugadorrid from jugadores where nombre = 'Fernando Cavenaghi';

insert into formacion_jugador
(formacion_rid, jugador_rid, estado)
values (@formacionrid, @jugadorrid, 1);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Teófilo Gutierrez', 6, 32, @jugadorrid);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Ariel Rojas', 6, 28, NULL);

select rid into @jugadorrid from jugadores where nombre = 'Ariel Rojas';

insert into formacion_jugador
(formacion_rid, jugador_rid, estado)
values (@formacionrid, @jugadorrid, 1);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Martin Aguirre', 6, 33, @jugadorrid);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Leonel Vangioni', 6, 24,NULL);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Leonardo Piscullichi', 6, 27,NULL);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Rodrigo Mora', 6, 27,NULL);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Carlos Sánchez', 6, 26,NULL);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Giovani Simeone', 6, 21,NULL);

-- jugadores boca 
insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Andrés Chavez', 4, 28,null);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Emmanuel Gigliotti', 3, 28, null);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Emmanuel Insúa', 2, 23, null);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Jonathan Calleri', 2, 21, null);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Leonardo Gabriel Suárez', 2, 18, null);

insert into jugadores
(nombre, handicap, edad, reemplazante_rid)
values ('Agustín Orion', 2, 44, null);

-- infracciones 
select rid into @jugadorrid from jugadores where nombre = 'Emmanuel Insúa';

insert into infracciones
(jugador_rid,fecha)
values (@jugadorrid,'2014-10-04');

insert into infracciones
(jugador_rid,fecha)
values (@jugadorrid,'2014-10-01');

insert into infracciones
(jugador_rid,fecha)
values (@jugadorrid,'2014-10-12');

insert into infracciones
(jugador_rid,fecha)
values (@jugadorrid,'2014-10-08');

select rid into @jugadorrid from jugadores where nombre = 'Ramiro Funes Mori';

insert into infracciones
(jugador_rid,fecha)
values (@jugadorrid,'2014-10-04');

insert into infracciones
(jugador_rid,fecha)
values (@jugadorrid,'2014-10-01');

insert into infracciones
(jugador_rid,fecha)
values (@jugadorrid,'2014-10-12');

insert into infracciones
(jugador_rid,fecha)
values (@jugadorrid,'2014-10-08');

select rid into @jugadorrid from jugadores where nombre = 'Rodrigo Mora';

insert into infracciones
(jugador_rid,fecha)
values (@jugadorrid,'2014-10-04');

insert into infracciones
(jugador_rid,fecha)
values (@jugadorrid,'2014-10-01');

insert into infracciones
(jugador_rid,fecha)
values (@jugadorrid,'2014-10-01');
