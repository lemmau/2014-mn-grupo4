package com.dds.grupo4.home

import java.util.List
import java.util.ArrayList

import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.excepciones.NoExisteJugadorPendienteException

class TodosLosJugadores {

	private List<Jugador> interesadosPendientes = new ArrayList<Jugador>
	private List<Jugador> interesadosAceptados = new ArrayList<Jugador>
	private InteresadosRechazados rechazados = new InteresadosRechazados

	def esUnInteresadoDelSistema(Jugador interesado) {
		interesadosPendientes.contains(interesado)
	}

	def esUnInteresadoAceptado(Jugador interesado) {
		interesadosAceptados.contains(interesado)
	}

	// TODO pasamanos revisar
	def esUnInteresadoRechazado(Jugador interesado) {
		rechazados.esUnInteresadoRechazado(interesado)
	}

	def eliminarInteresado(Jugador interesado) {
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

	def proponerJugador(Jugador interesado) {
		interesadosPendientes.add(interesado)
	}

	def aceptarInteresado(Jugador interesado) {
		eliminarInteresado(interesado)
		interesadosAceptados.add(interesado)
	}

	def rechazarInteresado(Jugador interesado, String motivo) {
		eliminarInteresado(interesado)
		rechazados.agregarRechazado(interesado, motivo)
	}

}
