package com.dds.grupo4.dominio

import org.joda.time.LocalDateTime

class Infraccion {

	@Property private String motivo
	@Property private LocalDateTime fecha 

	new(String motivo, LocalDateTime fecha) {
		_motivo = motivo
		_fecha = fecha
	}
}