package com.dds.grupo4.dominio

import java.time.LocalDateTime

// TODO mover esta clase a  com.dds.grupo4 NO VA EN HOME
class Denegacion {

	@Property Jugador interesado
	@Property LocalDateTime fecha
	@Property String motivo

	new (Jugador interesado,LocalDateTime fecha, String motivo) {
		this.interesado = interesado
		this.fecha = fecha
		this.motivo = motivo
	}

}