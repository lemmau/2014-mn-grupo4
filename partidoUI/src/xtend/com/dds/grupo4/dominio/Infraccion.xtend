package com.dds.grupo4.dominio

import org.joda.time.LocalDate

class Infraccion {

	@Property private String motivo
	@Property private LocalDate fecha 

	new(String motivo, LocalDate fecha) {
		_motivo = motivo
		_fecha = fecha
	}
}