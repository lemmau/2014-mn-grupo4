create table Usuario(
idUsuario serial not null primary key,
nombre varchar(30) not null,
apellido varchar(30) not null,
apodo varchar(15),
fecha_nacimiento date not null,
mail varchar(30) not null);

create table Administrador(
idAdmin serial not null primary key,
idUsuario integer references Usuario (idUsuario));

create table Jugador(
idJugador serial not null primary key,
idUsuario integer references Usuario (idUsuario),
handicap smallint not null);

create table Partido(
idPartido serial not null primary key,
nombre varchar(20)not null,
fecha date not null,
confirmado boolean not null DEFAULT FALSE,
idAdmin integer references Administrador(idAdmin));

create table Inscripcion_Partido(
idJugador integer references Jugador(idJugador), 
idPartido integer references Partido(idPartido),
tipo_inscripcion varchar(1) not null,
estaConfirmado boolean not null default false,
seDioDeBaja boolean not null default false,
equipoEnElQueJugo varchar(1),
primary key(idJugador,idPartido),
unique (idJugador,idPartido));

create table Infraccion(
idInfracion serial not null primary key,
idJugador integer references Jugador(idJugador),
motivo varchar(50) not null,
fecha date not null);

create table logBajaJugadorPartido(
idLog serial not null primary key,
idJugador integer references Jugador(idJugador),
idPartido integer references Partido(idPartido),
ofreceReemplazo boolean default false,
fecha date not null,
unique (idJugador,idPartido));

create table amigosUsuario(
idUsuario integer references Usuario(idUsuario),
idAmigo integer references Usuario(idUsuario),
primary key(idUsuario,idAmigo),
unique (idUsuario,idAmigo));

create table propuestaReemplazo(
idPropuesta serial not null primary key,
idJugador integer,
idReemplazo integer,
idPartido integer references Partido(idPartido),
tipo_inscripcion varchar(1) not null,
aceptada boolean,
constraint amigosUsuario_fkey foreign key (IdJugador,idReemplazo)
references amigosUsuario(IdUsuario,idAmigo), 
unique (idJugador,idPartido,idReemplazo));

create table administrador_propuesta(
idAdmin integer references Administrador(idAdmin),
idPropuesta integer references propuestaReemplazo(idPropuesta),
primary key(idAdmin,idPropuesta),
unique (idAdmin,idPropuesta));

create table Calificacion(
idCalificado integer references Jugador(idJugador),
idPartido integer references Partido(idPartido),
idCalifica integer references Jugador(idJugador),
nota smallint,
critica varchar(30),
primary key(idCalificado,idPartido,idCalifica),
constraint puedeSerCalificado_fkey foreign key (idCalificado, idPartido)
references inscripcion_partido(idJugador,idPartido),
constraint puedeCalificar_fkey foreign key (idCalifica, idPartido)
references inscripcion_partido(idJugador,idPartido))
