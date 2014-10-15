-- Saber los jugadores malos, con un handicap de 5 ó menos 

create function jugador_malo()
returns table (
	nombre varchar(30), 
	apellido varchar(30), 
	apodo varchar(15),
	fecha_nacimiento date, 
	handicap smallint)

as
'select nombre, apellido, apodo, fecha_nacimiento, handicap from jugador j
join usuario u on u.idUsuario= j.idUsuario
where handicap < 5;'language sql;

select * from jugador_malo()

-- Saber qué jugadores son traicioneros, los que tuvieron más de 3 infracciones el 
-- último mes 

select u.nombre, count(u.nombre) as cantidad_infracciones
from infraccion i
join jugador j on (j.idJugador = i.idJugador)
join usuario u on (u.idUsuario = j.idUsuario)
where EXTRACT(MONTH FROM current_date)-EXTRACT(MONTH FROM i.fecha)<=1
group by 1
having count(u.nombre) >= 3

-- Saber cuántos jugadores podrían “mejorar” con el tiempo, son los jugadores 
-- malos que tienen menos de 25 años (nota: debe evitar lógica duplicada) 

select count(*) cuantosPuedenMejorar from jugador_malo()
where (extract(year from current_date)-extract(year from fecha_nacimiento))<24

-- Reflejar que un jugador se da de baja a un partido.

create or replace function ofreceReemplazo(id_jugador integer, id_partido integer) returns boolean
as $$

declare tieneReemplazo boolean default false;
declare C integer;

begin
	select count(*) as cantidad
		from propuestaReemplazo p
		where p.idJugador = id_jugador
		and p.idPartido = id_partido into C;

	if(C > 0) then
		tieneReemplazo := true;
	end if;	

return tieneReemplazo;
end; 
$$language plpgsql;


create or replace function loguearBaja() returns trigger as $logBajaJugadorPartido$

declare reemplazo boolean;
	idJ integer;
	idP integer;


begin
	if(TG_OP = 'UPDATE') then 

	idJ = OLD.idJugador;
	idP = OLD.idPartido;
	
	select ofreceReemplazo from ofreceReemplazo(idJ,idP) into reemplazo;

	insert into logBajaJugadorPartido (idJugador, idPartido, ofreceReemplazo,fecha )
		values (OLD.idJugador, OLD.idPartido, reemplazo, current_date);
	return OLD;	

	end if;
	return null;
end; 
$logBajaJugadorPartido$language plpgsql;

create trigger loguearBaja after update on inscripcion_partido
for each row
when (OLD.seDioDeBaja is distinct from NEW.seDioDeBaja)
execute procedure loguearBaja();


UPDATE inscripcion_partido
   SET sediodebaja=true
 WHERE idJugador = 4 AND   
       idPartido = 1		

select * from logBajaJugadorPartido

-- Cada vez que un jugador se baje de un partido se le debe agregar una infracción 
-- si no ofrece reemplazante. 

create or replace function generarInfraccion() returns trigger as $Infraccion$

declare reemplazo boolean;
	idJ integer;
	idP integer;

begin
	if(TG_OP = 'INSERT') then 

	idJ := NEW.idJugador;
	idP := NEW.idPartido;
	
	select ofreceReemplazo from ofreceReemplazo(idJ,idP) into reemplazo;

		if (reemplazo = false) then
			INSERT INTO infraccion(idjugador, motivo, fecha)
			VALUES (idJ, 'No ofrece reemplazo', current_date);
		end if;	

	end if;
	return null;
end; 
$Infraccion$language plpgsql;

create trigger generarInfraccion after insert on logBajaJugadorPartido
for each row
execute procedure generarInfraccion();

select * from inscripcion_partido
 
update inscripcion_partido set seDioDeBaja = true
where idJugador = 2 and idPartido = 1

select * from logBajaJugadorPartido
select * from infraccion
select * from propuestaReemplazo
