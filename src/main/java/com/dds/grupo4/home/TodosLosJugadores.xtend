package com.dds.grupo4.home

import java.util.List
import java.util.ArrayList

import com.dds.grupo4.Interesado
import com.dds.grupo4.excepciones.NoExisteJugadorPendienteException

class TodosLosJugadores {

	private List<Interesado> interesadosPendientes = new ArrayList<Interesado>
	private List<Interesado> interesadosAceptados = new ArrayList<Interesado>
	private InteresadosRechazados rechazados = new InteresadosRechazados

	def esUnInteresadoDelSistema(Interesado interesado) {
		interesadosPendientes.contains(interesado)
	}

	def esUnInteresadoAceptado(Interesado interesado) {
		interesadosAceptados.contains(interesado)
	}

	def eliminarInteresado(Interesado interesado) {
		if (!interesadosPendientes.remove(interesado))
			throw new NoExisteJugadorPendienteException("El jugador no existe entre los pendientes de aprobacion")
	}

	def getInteresadosDelSistema() {
		interesadosPendientes.clone
	}

	def getInteresadosAceptados() {
		interesadosAceptados.clone
	}

	def Integer cantInteresadosPendientes() {
		interesadosPendientes.size
	}

	def Integer cantInteresadosAceptados() {
		interesadosAceptados.size
	}

	// TODO este Pasamanos no me gusta mucho
	def Integer cantInteresadosRechazados() {
		rechazados.cantInteresadosRechazados
	}

	def proponerJugador(Interesado interesado) {
		interesadosPendientes.add(interesado)
	}

	def aceptarInteresado(Interesado interesado) {
		eliminarInteresado(interesado)
		interesadosAceptados.add(interesado)
	}

	def rechazarInteresado(Interesado interesado, String motivo) {
		eliminarInteresado(interesado)
		rechazados.agregarRechazado(interesado, motivo)
	}

}
