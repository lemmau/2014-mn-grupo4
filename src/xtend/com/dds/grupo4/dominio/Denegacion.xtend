package com.dds.grupo4.dominio

import org.joda.time.LocalDate

// TODO mover esta clase a  com.dds.grupo4 NO VA EN HOME
class Denegacion {

	@Property Jugador interesado
	@Property LocalDate fecha
	@Property String motivo

	new (Jugador interesado,LocalDate fecha, String motivo) {
		this.interesado = interesado
		this.fecha = fecha
		this.motivo = motivo
	}

}