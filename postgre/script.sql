create table Usuario(
idUsuario serial not null primary key,
nombre varchar(30) not null,
apellido varchar(30) not null,
apodo varchar(15),
fecha_nacimiento date not null,
mail varchar(30) not null)

create table Jugador(
idJugador serial not null primary key,
idUsuario integer references Usuario (idUsuario),
handicap smallint not null)

create table Partido(
idPartido serial not null primary key,
nombre varchar(20)not null,
fecha date not null,
confirmado boolean not null DEFAULT FALSE,
idAdmin integer references Usuario(idUsuario))

create table Inscripcion_Partido(
idJugador integer references Jugador(idJugador), 
idPartido integer references Partido(idPartido),
tipo_inscripcion varchar(1) not null,
estaConfirmado boolean not null default false,
seDioDeBaja boolean not null default false,
equipoEnElQueJugo varchar(1),
primary key(idJugador,idPartido),
unique (idJugador,idPartido))

create table Infraccion(
idInfracion serial not null primary key,
idJugador integer references Jugador(idJugador),
motivo varchar(50) not null,
fecha date not null)

create table logBajaJugadorPartido(
idLog serial not null primary key,
idJugador integer references Jugador(idJugador),
idPartido integer references Partido(idPartido),
ofreceReemplazo boolean default false,
fecha date not null,
unique (idJugador,idPartido))

create table propuestaReemplazo(
idJugador integer references Jugador(idJugador),
idPartido integer references Partido(idPartido),
idReemplazo integer references Usuario(idUsuario),
tipo_inscripcion varchar(1) not null,
aceptada boolean not null default false, 
primary key(idJugador,idPartido, idReemplazo),
unique (idJugador,idPartido,idReemplazo))

--faltan crear las tablas de aca abajo

create table Calificacion(
id_quien_califica integer references Jugador(jugador_id),
id_calificado integer references Jugador(jugador_id),
partido_id integer references Partido(partido_id),
nota smallint,
critica varchar(30),
primary key(id_quien_califica,id_calificado,partido_id))
