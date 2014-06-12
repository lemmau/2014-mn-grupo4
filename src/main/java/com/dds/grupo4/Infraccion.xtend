package com.dds.grupo4

import java.time.LocalDateTime

class Infraccion {

	@Property private String motivo

	// TODO Este es otro campo calculado que va a complicar las cosas si deciden cambiar 
	// el criterio de vencimiento de la infraccion
	// Me parece mejor guardar la fecha en que se genero la infraccion
	@Property private LocalDateTime limitDate 
	
	new(String motivo, LocalDateTime limitDate) {
		this.motivo = motivo
		this.limitDate = limitDate
	}
}