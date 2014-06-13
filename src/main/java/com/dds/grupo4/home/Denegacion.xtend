package com.dds.grupo4.home

import com.dds.grupo4.Interesado
import java.time.LocalDateTime

class Denegacion {

	@Property Interesado interesado
	@Property LocalDateTime fecha
	@Property String motivo

	new (Interesado interesado,LocalDateTime fecha, String motivo) {
		this.interesado = interesado
		this.fecha = fecha
		this.motivo = motivo
	}

}