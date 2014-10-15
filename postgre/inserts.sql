INSERT INTO usuario(nombre, apellido, apodo, fecha_nacimiento, mail)
    VALUES ('gonzalo', 'franchino', 'franchi', '15/5/1988', 'gonzalo.franchino@gmail.com');

INSERT INTO usuario(nombre, apellido, apodo, fecha_nacimiento, mail)
    VALUES ('osvaldo', 'corneli', 'os', '11/8/1990', 'os.corneli@gmail.com');

INSERT INTO usuario(nombre, apellido, apodo, fecha_nacimiento, mail)
    VALUES ('diego', 'anazonian', 'diega', '13/4/1992', 'danazonian@yahoo.com');    

INSERT INTO usuario(nombre, apellido, apodo, fecha_nacimiento, mail)
    VALUES ('leandro', 'mauro', 'lean', '12/9/1993', 'l.mauro@gmail.com');

INSERT INTO usuario(nombre, apellido, apodo, fecha_nacimiento, mail)
    VALUES ('leandro', 'gallina', 'gayi', '24/6/1987', 'lng1987@gmail.com');

INSERT INTO usuario(nombre, apellido, apodo, fecha_nacimiento, mail)
    VALUES ('luciano', 'prestia', 'lucho', '11/2/1988', 'lp@gmail.com');       

INSERT INTO usuario(nombre, apellido, apodo, fecha_nacimiento, mail)
    VALUES ('brian', 'hilu', 'iglu', '30/4/1985', 'brian.hilu@gmail.com');

INSERT INTO usuario(nombre, apellido, apodo, fecha_nacimiento, mail)
    VALUES ('juan', 'riquelme', 'd10s', '24/6/1978', 'jrr10@gmail.com');

INSERT INTO usuario(nombre, apellido, apodo, fecha_nacimiento, mail)
    VALUES ('ivan', 'correa', 'ivo', '17/1/1984', 'iac@gmail.com');        
    
INSERT INTO usuario(nombre, apellido, apodo, fecha_nacimiento, mail)
    VALUES ('juan', 'sanchez', 'pepe', '11/8/1976', 'pepe@gmail.com');

INSERT INTO usuario(nombre, apellido, apodo, fecha_nacimiento, mail)
    VALUES ('juan', 'sandoval', 'juani', '11/8/1995', 'jsandoval@gmail.com');

INSERT INTO jugador(idusuario, handicap)
    VALUES (1, 9);

INSERT INTO jugador(idusuario, handicap)
    VALUES (2, 3);

INSERT INTO jugador(idusuario, handicap)
    VALUES (3, 1);    
    
INSERT INTO jugador(idusuario, handicap)
    VALUES (4, 6);

INSERT INTO jugador(idusuario, handicap)
    VALUES (5, 2);

INSERT INTO jugador(idusuario, handicap)
    VALUES (6, 2);
     
INSERT INTO jugador(idusuario, handicap)
    VALUES (7, 5);

INSERT INTO jugador(idusuario, handicap)
    VALUES (8, 10);
    
INSERT INTO jugador(idusuario, handicap)
    VALUES (9, 7);

INSERT INTO jugador(idusuario, handicap)
    VALUES (10, 4); 

INSERT INTO partido(nombre, fecha, idadmin)
    VALUES ('boca-riber', '14/10/2014', 10);

INSERT INTO inscripcion_partido(idjugador, idpartido, tipo_inscripcion, estaConfirmado)
    VALUES (1, 1, 'E', true);

INSERT INTO inscripcion_partido(idjugador, idpartido, tipo_inscripcion, estaConfirmado)
    VALUES (2, 1, 'E', true);

INSERT INTO inscripcion_partido(idjugador, idpartido, tipo_inscripcion, estaConfirmado)
    VALUES (3, 1, 'E', true);

INSERT INTO inscripcion_partido(idjugador, idpartido, tipo_inscripcion, estaConfirmado)
    VALUES (4, 1, 'E', true);

INSERT INTO inscripcion_partido(idjugador, idpartido, tipo_inscripcion, estaConfirmado)
    VALUES (5, 1, 'E', true);

INSERT INTO inscripcion_partido(idjugador, idpartido, tipo_inscripcion, estaConfirmado)
    VALUES (6, 1, 'E', true);

INSERT INTO inscripcion_partido(idjugador, idpartido, tipo_inscripcion, estaConfirmado)
    VALUES (7, 1, 'E', true);

INSERT INTO inscripcion_partido(idjugador, idpartido, tipo_inscripcion, estaConfirmado)
    VALUES (8, 1, 'E', true);                        

INSERT INTO inscripcion_partido(idjugador, idpartido, tipo_inscripcion, estaConfirmado)
    VALUES (9, 1, 'E', true);
   
INSERT INTO infraccion(idjugador, motivo, fecha)
    VALUES (9, 'No presento reemplazo a partido', '1/10/2014');

INSERT INTO infraccion(idjugador, motivo, fecha)
    VALUES (9, 'No presento reemplazo a partido', '2/10/2014');

INSERT INTO infraccion(idjugador, motivo, fecha)
    VALUES (9, 'No presento reemplazo a partido', '3/10/2014');

INSERT INTO infraccion(idjugador, motivo, fecha)
    VALUES (9, 'No presento reemplazo a partido', '4/10/2014');

INSERT INTO infraccion(idjugador, motivo, fecha)
    VALUES (3, 'No presento reemplazo a partido', '1/10/2014');

INSERT INTO propuestareemplazo(idjugador, idpartido, idreemplazo, tipo_inscripcion)
    VALUES (2, 1, 11, 'E');


