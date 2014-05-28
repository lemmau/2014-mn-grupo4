package com.dds.grupo4

import java.util.List
import org.joda.time.DateTime
import java.util.ArrayList
import com.dds.grupo4.excepciones.BusinessException
import java.util.Random

class Partido {

	val private static MIN_CANTIDAD_JUGADORES = Integer.valueOf(0)
	val private static MAX_CANTIDAD_JUGADORES = Integer.valueOf(10)
	@Property DateTime fechaInicio;
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

	def Boolean esUnInteresado(Interesado interesado) {
		return this.interesados.contains(interesado)
	}

	def void darDeBajaA(Interesado interesado, Infraccion infraccion) {
		var Interesado reemplazante;
		val Random random = new Random()

		try {
			this.interesados.remove(interesado)
			reemplazante = this.interesados.get(random.nextInt(this.interesados.size))
		} catch (Exception ex) {
			interesado.agregarInfraccion(infraccion)
			throw new BusinessException("No hay reemplazante para este jugador, se lo ha multado por dicho suceso")
		}
	}

	def calificarJugadores() {
		this.jugadoresDelPartido.forEach[jugador|jugador.calificarAlResto(this.jugadoresDelPartido, this)]
	}

	def quieroProponerUnAmigo(Interesado interesado) {
		this.admin.validarPropuesta(interesado, this);
	}

}
