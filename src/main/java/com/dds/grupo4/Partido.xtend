package com.dds.grupo4

import java.util.List
import org.joda.time.DateTime
import java.util.ArrayList

class Partido {

	val private static PRIMERA_POSICION = 0
	val private static UNA_POSICION = 1
	val private static MIN_CANTIDAD_JUGADORES = Integer.valueOf(0)
	val private static MAX_CANTIDAD_JUGADORES = Integer.valueOf(10)
	@Property DateTime fechaInicio;
	@Property List<Interesado> interesados = new ArrayList;

	def void inscribirA(Interesado interesado) {

		var cantInteresados = this.interesados.filter[inte|inte.sosEstandar].size;

		if (cantInteresados <= MAX_CANTIDAD_JUGADORES) {
			interesado.inscribite(this);
		}
	}

	def List<Interesado> jugadoresFinales() {
		
		if (! (this.interesados.size < MAX_CANTIDAD_JUGADORES)) {
			return this.interesados.subList(MIN_CANTIDAD_JUGADORES, MAX_CANTIDAD_JUGADORES);
		} else {
			throw new RuntimeException("No hay diez jugadores para realizar un partido")
		}
	}

	def inscribirEstandar(Interesado interesadoEstandar) {
		this.interesados.add(PRIMERA_POSICION, interesadoEstandar)
	}

	def inscribirSolidario(Interesado interesadoSolidario) {
		val Interesado interesadoEstandar = this.interesados.findLast[inte|inte.sosEstandar]
		val Integer posicion = this.interesados.lastIndexOf(interesadoEstandar) + UNA_POSICION

		this.interesados.add(posicion, interesadoSolidario);
	}

	def inscribirCondicional(Interesado interesadoCondicional) {

		//HAY QUE RETOCAR ESTO PARA QUE VERIFIQUE LA CONDICION DEL PARTIDO SOBRE EL INTERESADO CONDICIONAL
		this.interesados.add(interesadoCondicional)

	}

}
