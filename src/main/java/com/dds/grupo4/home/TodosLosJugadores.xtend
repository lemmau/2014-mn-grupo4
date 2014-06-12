package com.dds.grupo4.home

import java.util.List
import com.dds.grupo4.Interesado
import java.util.ArrayList
import java.time.LocalDateTime

class TodosLosJugadores {

	private List<Interesado> interesadosDelSistema = new ArrayList<Interesado>
	private List<Denegacion> interesadosRechazados = new ArrayList<Denegacion>
	private List<Interesado> interesadosAceptados = new ArrayList<Interesado>

	def esUnInteresadoDelSistema(Interesado interesado) {
		interesadosDelSistema.contains(interesado)
	}

	def esUnInteresadoRechazado(Interesado interesado) {
		interesadosRechazados.contains(interesado)
	}

	def esUnInteresadoAceptado(Interesado interesado) {
		interesadosAceptados.contains(interesado)
	}

	def eliminarInteresado(Interesado interesado) {
		interesadosDelSistema.remove(interesado)
	}

	def getInteresadosDelSistema() {
		interesadosDelSistema.clone
	}

	def getInteresadosRechazados() {
		interesadosRechazados.clone
	}

	def getInteresadosAceptados() {
		interesadosAceptados.clone
	}

	def Integer getCantInteresadosDelSistema() {
		interesadosDelSistema.size
	}

	def Integer getCantInteresadosRechazados() {
		interesadosRechazados.size
	}

	def Integer getCantInteresadosAceptados() {
		interesadosAceptados.size
	}

	def proponerJugador(Interesado interesado) {
		interesadosDelSistema.add(interesado)
	}

	def aceptarInteresado(Interesado interesado) {
		eliminarInteresado(interesado)
		interesadosAceptados.add(interesado)
	}

	def rechazarInteresado(Interesado interesado, String motivo) {
		eliminarInteresado(interesado)
		interesadosRechazados.add(new Denegacion(interesado, LocalDateTime.now, motivo))
	}

}
