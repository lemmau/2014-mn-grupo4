-- a) Saber los jugadores malos, con un handicap de 5 o menos.
DROP VIEW IF EXISTS JUGADORESMALOS;

CREATE VIEW JUGADORESMALOS AS
SELECT u.nombre, u.edad
FROM jugadores j, usuarios u
WHERE u.id = j.usuario_id
AND handicap < 5;
   
SELECT * FROM JUGADORESMALOS;