DROP FUNCTION IF EXISTS fn_check_tienereemplazante;

DELIMITER //

CREATE FUNCTION fn_check_tienereemplazante(Jugadoid int) RETURNS NUMERIC
BEGIN
   DECLARE TieneReemplazo NUMERIC DEFAULT 0;
   
SELECT amigo_jugador_id
	into @tiene_reemplazo
    FROM Jugadores
    WHERE id = Jugadoid;
    
    IF @tiene_reemplazo THEN
		SET TieneReemplazo = @tiene_reemplazo;
	ELSE
		SET TieneReemplazo = 0;
	END IF;

    RETURN TieneReemplazo;
    
END //

DELIMITER ;

 SELECT fn_check_tienereemplazante(10);	-- Emmanuel Insúa es el UNICO que tiene reemplazante !!!

/*
DROP PROCEDURE IF EXISTS `sp-check_reemplazante`;

DELIMITER $$

CREATE PROCEDURE `sp_check_reemplazante` (IN param INT)
BEGIN

SELECT 

END $$
DELIMITER ;
*/

