package com.dds.grupo4.home

import java.util.List
import java.util.ArrayList

import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.excepciones.NoExisteJugadorPendienteException

class TodosLosJugadores {

	private List<Jugador> interesadosPendientes = new ArrayList<Jugador>
	private List<Jugador> interesadosAceptados = new ArrayList<Jugador>
	private InteresadosRechazados rechazados = new InteresadosRechazados

	/** singleton **/
	static TodosLosJugadores instance

	private new() {
		interesadosAceptados = new ArrayList<Jugador>
		interesadosPendientes = new ArrayList<Jugador>
	}

	static def getInstance() {
		if (instance == null) {
			instance = new TodosLosJugadores()
		}
		instance
	}

	/** fin singleton **/
	//Para los test
	def borrarTodo() {
		interesadosPendientes = new ArrayList<Jugador>
		interesadosAceptados = new ArrayList<Jugador>
		rechazados = new InteresadosRechazados
	}

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
		interesado.id = new Long(this.ultimoIdUtilizado.longValue + 1)
		interesadosAceptados.add(interesado)
	}

	def ultimoIdUtilizado() {

		if (interesadosAceptados.isEmpty) {
			return 1
		}
		return interesadosAceptados.sortBy[-it.id].toList.get(0).id.intValue
	}

	def rechazarInteresado(Jugador interesado, String motivo) {
		eliminarInteresado(interesado)
		rechazados.agregarRechazado(interesado, motivo)
	}

	def getJugador(Long id) {
		interesadosAceptados.findFirst[jugador|jugador.id.equals(id)]
	}

	def getJugadores() {
		return interesadosAceptados
	}

	def getJugadores(Jugador jugadorBusqueda) {
		println(jugadorBusqueda.nombre + jugadorBusqueda.apodo + jugadorBusqueda.apellido)
		val nombreBusqueda = jugadorBusqueda.nombre.toLowerCase

		interesadosAceptados.filter [ jugador |
			jugador.nombre.toLowerCase().startsWith(nombreBusqueda.toLowerCase()) ||
				jugador.apodo.toLowerCase.contains(jugadorBusqueda.apodo.toLowerCase()) ||
				jugador.fechaNacimiento.isAfter(jugadorBusqueda.fechaNacimiento)
		]

	}

}
