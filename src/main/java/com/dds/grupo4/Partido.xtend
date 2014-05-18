package com.dds.grupo4

import java.util.List
import org.joda.time.DateTime
import java.util.ArrayList
import com.dds.grupo4.observers.PartidoObservador
import com.dds.grupo4.excepciones.BusinessException

class Partido {

	val private static MIN_CANTIDAD_JUGADORES = Integer.valueOf(0)
	val private static MAX_CANTIDAD_JUGADORES = Integer.valueOf(10)
	@Property DateTime fechaInicio;
	@Property List<Interesado> interesados = new ArrayList;
	@Property List<PartidoObservador> observers = new ArrayList;
	@Property private Admin admin

	def void inscribirA(Interesado nuevoInteresado) {

		val Integer posicion = this.interesados.indexOf(
			this.interesados.findFirst[interesado|interesado.getPrioridad > nuevoInteresado.getPrioridad])

		try {
			this.interesados.add(posicion, nuevoInteresado)
		} catch (BusinessException exception) {
			this.interesados.add(nuevoInteresado)
		}

		this.observers.forEach[observer|observer.notificar(this, nuevoInteresado)]
	}

	def List<Interesado> jugadoresFinales() {

		if (! (this.interesados.size < MAX_CANTIDAD_JUGADORES)) {
			return this.interesados.subList(MIN_CANTIDAD_JUGADORES, MAX_CANTIDAD_JUGADORES);
		} else {
			throw new RuntimeException("No hay diez jugadores para realizar un partido")
		}
	}

	def Boolean esUnInteresado(Interesado interesado) {
		return this.interesados.contains(interesado)
	}

	def void darDeBajaA(Interesado interesado, Infraccion infraccion) {

		if (this.interesados.contains(interesado)) {

			try {
				this.inscribirA(interesado.getReemplazante)
			} catch (RuntimeException e) {
				interesado.agregarInfraccion(infraccion)
			} finally {
				this.interesados.remove(interesado)
				this.observers.forEach[observer|observer.notificar(this, interesado)]
			}
		}
	}

}
