-- e) Agregar infraccion c/vez que se de la baja a jugador y no tenga reemplazo
DROP TRIGGER IF exists AgregarInfraccion_Formacion_Jugador;

DELIMITER |
    
CREATE TRIGGER AgregarInfraccion_Formacion_Jugador AFTER UPDATE ON Formacion_Jugador
FOR EACH ROW BEGIN
	
    DECLARE tienereemplazo INT;

	SELECT fn_check_tienereemplazante(NEW.jugador_id) into tienereemplazo;
	IF (NEW.estado <> 1 AND !tienereemplazo) THEN
		INSERT INTO Infracciones
		(descripcion, jugador_id, fecha )
		VALUES
		('Sancion por falta de reemplazo', OLD.jugador_id, SYSDATE());
	END IF;
/*
    IF NEW.status <> OLD.status
    -- @Result <> 1
    THEN
	   INSERT INTO Infracciones
	   (descripcion, jugador_id, fecha )
	   VALUES
	   ('Sancion por falta de reemplazo', NEW.jugador_id, SYSDATE());
   END IF;
*/
END
|

DELIMITER ;

select * from formacion_jugador;

select * from infracciones;

select * from infracciones where descripcion is not null;

select * from jugadores where id=5; -- Emanuel Mammana (quien NO tiene reemplazo)

update formacion_jugador set estado = 0 where jugador_id=5;

