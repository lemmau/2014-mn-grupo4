DROP FUNCTION IF EXISTS fn_check_tienereemplazante;

DELIMITER //

CREATE FUNCTION fn_check_tienereemplazante(Jugadorrid int) RETURNS NUMERIC
BEGIN
   DECLARE TieneReemplazo NUMERIC DEFAULT 0;
   
SELECT reemplazante_rid
	into @tiene_reemplazo
    FROM Jugadores
    WHERE rid = Jugadorrid;
    
    IF @tiene_reemplazo THEN
		SET TieneReemplazo = @tiene_reemplazo;
	ELSE
		SET TieneReemplazo = 0;
	END IF;

    RETURN TieneReemplazo;
    
END //

DELIMITER ;

 SELECT fn_check_tienereemplazante(5);	-- barovero tiene reemplazante

/*
DROP PROCEDURE IF EXISTS `sp-check_reemplazante`;

DELIMITER $$

CREATE PROCEDURE `sp_check_reemplazante` (IN param INT)
BEGIN

SELECT 

END $$
DELIMITER ;
*/

