-- d) Reflejar que un jugador se da de baja a un partido.
SELECT * 
FROM formacion_jugador
WHERE estado <> 0;
-- 7 rows returned

UPDATE formacion_jugador
SET estado = 0
WHERE jugador_id = 1;

SELECT * 
FROM formacion_jugador
WHERE estado <> 0;
-- 6 rows returned
