-- b) Saber que jugadores son traicioneros, los que tuvieron mas de 3 infracciones el ultimo mes.
DROP VIEW IF EXISTS JUGADORESTRAICIONEROS;

CREATE VIEW JUGADORESTRAICIONEROS AS
SELECT u.nombre, COUNT(*) as cantidad_de_infracciones
FROM jugadores j, infracciones i, usuarios u
WHERE u.id = j.usuario_id
AND j.id = i.jugador_id
AND MONTH(i.fecha) = MONTH(NOW())
GROUP BY u.nombre
HAVING COUNT(*) > 3;
   
SELECT * FROM JUGADORESTRAICIONEROS;


/*
SELECT NOW();
SELECT DATE_SUB(NOW(), INTERVAL 1 MONTH);
SELECT (NOW() - INTERVAL 1 MONTH);
SELECT CURRENT_DATE;
SELECT MONTH(CURRENT_DATE);
SELECT MONTH(CURRENT_DATE - INTERVAL 1 MONTH);
*/