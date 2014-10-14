-- c) Saber cuantos jugadores podrian mejorar con el tiempo, son los jugadores malos que tienen menos de 25 anios (EVITAR LOGICA).
DROP FUNCTION IF EXISTS cuantosJugadoresPodrianMejorar;

DELIMITER //

CREATE FUNCTION cuantosJugadoresPodrianMejorar() RETURNS NUMERIC
BEGIN
   DECLARE Cantidad NUMERIC DEFAULT 0;
   
	SELECT COUNT(*) 
		into @Cantidad 
    FROM JUGADORESMALOS
	WHERE edad < 25;
    
	SET Cantidad = @Cantidad;

    RETURN Cantidad;
    
END //

DELIMITER ;

SELECT cuantosJugadoresPodrianMejorar();
