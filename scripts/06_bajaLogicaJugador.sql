-- d) Reflejar que un jugador se da de baja a un partido.
SELECT * 
FROM formacion_jugador
WHERE status <> 0;
-- 7 rows returned

UPDATE formacion_jugador
SET status = 0
WHERE jugador_rid = 1;

SELECT * 
FROM formacion_jugador
WHERE status <> 0;
-- 6 rows returned
