SELECT * FROM EQUIPOS;

select * from jugadores WHERE edad < 25;

SELECT * FROM jugadores WHERE handicap < 5;

SELECT * FROM infracciones;

-- SELECT * FROM infracciones WHERE MONTH(fecha) < MONTH(CURRENT_DATE - INTERVAL 1 MONTH);

SELECT * FROM JUGADORESMALOS;


select * from jugadores j, usuarios u
where j.usuario_id = u.id
and i.nombre= '