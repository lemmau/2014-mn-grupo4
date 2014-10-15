-- a) Saber los jugadores malos, con un handicap de 5 o menos.
DROP VIEW IF EXISTS JUGADORESMALOS;

CREATE VIEW JUGADORESMALOS AS
SELECT nombre, edad
FROM jugadores
WHERE handicap < 5;
   
SELECT * FROM JUGADORESMALOS;