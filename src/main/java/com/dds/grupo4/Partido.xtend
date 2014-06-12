package com.dds.grupo4

import java.util.List
import java.util.ArrayList
import com.dds.grupo4.excepciones.BusinessException
import java.time.LocalDateTime

class Partido {

	val private static MIN_CANTIDAD_JUGADORES = Integer.valueOf(0)
	val private static MAX_CANTIDAD_JUGADORES = Integer.valueOf(10)
	@Property LocalDateTime fechaInicio;
	@Property List<Interesado> interesados = new ArrayList;
	@Property private Admin admin
	@Property private String mail
	@Property List<Interesado> jugadoresDelPartido = new ArrayList

	new(Admin admin) {
		this.admin = admin
	}

	def void inscribirA(Interesado nuevoInteresado) {

		val Integer posicion = this.interesados.indexOf(
			this.interesados.findFirst[interesado|interesado.getPrioridad > nuevoInteresado.getPrioridad])

		// TODO este if no hace nada?
		if (this.interesados.filter[inte|inte.estasConfirmado(this)].size > 10) {
			//this.notificacionAdmin.notificarConfirmacion(this)
		}

		try {
			this.interesados.add(posicion, nuevoInteresado)
		} catch (Exception exception) {
			this.interesados.add(nuevoInteresado)
		}

	}

	def List<Interesado> jugadoresFinales() {
		try {
			return this.interesados.filter[interesado|interesado.estasConfirmado(this)].toList.subList(
				MIN_CANTIDAD_JUGADORES, MAX_CANTIDAD_JUGADORES)
		} catch (Exception ex) {
			throw new BusinessException("No hay diez jugadores para realizar un partido")
		}
	}

	def cantidadInteresados () {
		this.interesados.size 
	}

	def Boolean esUnInteresado(Interesado interesado) {
		return this.interesados.contains(interesado)
	}

	def void darDeBajaA(Interesado interesado) {
		this.interesados.remove(interesado)
		this.generarInfraccionA(interesado)
	}
	
	def void darDeBajaA(Interesado resagado,Interesado reemplazante){
		this.interesados.remove(resagado)
		this.inscribirA(reemplazante)
	}

	def void generarInfraccionA(Interesado interesado) {
		val String motivo = "No tiene reemplazante"
		val vencimientoInfraccion = LocalDateTime.now().plusWeeks(1)
		
		interesado.agregarInfraccion(new Infraccion(motivo, vencimientoInfraccion))
	}

	def calificarJugadores() {
		this.jugadoresFinales.forEach[jugador|jugador.calificarAlResto(this.jugadoresFinales, this)]
	}

	def void calificarA(Interesado jugador, Integer puntaje, String critica) {
		val Interesado jugadorAcalificar = this.jugadoresFinales.findFirst[ j | j.equals(jugador) ]

		if (null == jugadorAcalificar)
			throw new BusinessException("Solo se puede calificar a jugadores del partido");

		jugadorAcalificar.calificarJugador( new Calificacion(this, puntaje, critica ) )
	}

}
