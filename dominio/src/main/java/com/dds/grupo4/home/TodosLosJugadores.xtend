package com.dds.grupo4.home

import java.util.List

import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.excepciones.NoExisteJugadorPendienteException
import com.dds.grupo4.service.JugadoresService
import com.dds.grupo4.connector.DataBaseConnector
import com.dds.grupo4.dominio.Denegacion
import org.joda.time.LocalDateTime

class TodosLosJugadores {

	//private List<Jugador> interesadosPendientes = new ArrayList<Jugador>
	//private List<Jugador> interesadosAceptados = new ArrayList<Jugador>
	//private InteresadosRechazados rechazados = new InteresadosRechazados
	private JugadoresService jugadoresService

	/** singleton **/
	static TodosLosJugadores instance

	private new(JugadoresService service) {
		this.jugadoresService = service

	//interesadosAceptados = new ArrayList<Jugador>//	def ultimoIdUtilizado() {
	//
	//		if (interesadosAceptados.isEmpty) {
	//			return 1
	//		}
	//		return interesadosAceptados.sortBy[-it.id].toList.get(0).id.intValue
	//	}
	//interesadosPendientes = new ArrayList<Jugador>
	}

	static def getInstance() {
		if (instance == null) {
			instance = new TodosLosJugadores(new JugadoresService(new DataBaseConnector("futbol5")))
		}
		instance
	}

	/** fin singleton **/
	//Para los test
	def borrarTodo() {

		//interesadosPendientes = new ArrayList<Jugador>
		//interesadosAceptados = new ArrayList<Jugador>
		//rechazados = new InteresadosRechazados
		jugadoresService.eliminarTodosLosJugadores(JugadoresService.ACCEPTED_PLAYERS)
		jugadoresService.eliminarTodosLosJugadores(JugadoresService.REJECTED_PLAYERS)
		jugadoresService.eliminarTodosLosJugadores(JugadoresService.OUTSTANDING_PLAYERS)
	}

	//	def esUnInteresadoDelSistema(Jugador interesado) {
	//		interesadosPendientes.contains(interesado)
	//	}
	def esUnInteresadoAceptado(Jugador interesado) {
		interesadosAceptados.filter[jugador|jugador.id == interesado.id].toList.size == 1
	}

	// TODO pasamanos revisar
	def boolean esUnInteresadoRechazado(Jugador interesado) {

		//rechazados.esUnInteresadoRechazado(interesado)
		jugadoresService.esUnRechazado(interesado)
	}

	def eliminarInteresado(Jugador interesado) {

		//		if (!interesadosPendientes.remove(interesado))
		//			throw new NoExisteJugadorPendienteException("El jugador no existe entre los pendientes de aprobacion")
		if (!jugadoresService.remove(interesado, JugadoresService.OUTSTANDING_PLAYERS)) {
			throw new NoExisteJugadorPendienteException("El jugador no existe entre los pendientes de aprobacion")
		}
	}

	def getInteresadosDelSistema() {
		jugadoresService.getAllPlayers(JugadoresService.OUTSTANDING_PLAYERS)

	//interesadosPendientes.clone
	}

	def List<Jugador> getInteresadosAceptados() {

		//interesadosAceptados.clone.toList
		jugadoresService.getAllPlayers(JugadoresService.ACCEPTED_PLAYERS)
	}

	def Integer cantInteresadosPendientes() {
		jugadoresService.getAllPlayers(JugadoresService.OUTSTANDING_PLAYERS).size

	//interesadosPendientes.size
	}

	def Integer cantInteresadosAceptados() {
		jugadoresService.getAllPlayers(JugadoresService.ACCEPTED_PLAYERS).size
	}

	// TODO este Pasamanos no me gusta mucho
	def Integer cantInteresadosRechazados() {
		jugadoresService.cantidadInteresadosRechazados
	}

	def proponerJugador(Jugador interesado) {
		jugadoresService.insertPlayer(interesado, JugadoresService.OUTSTANDING_PLAYERS)

	//interesadosPendientes.add(interesado)
	}

	def aceptarInteresado(Jugador interesado) {
		eliminarInteresado(interesado)

		//interesadosAceptados.add(interesado)
		jugadoresService.insertPlayer(interesado, JugadoresService.ACCEPTED_PLAYERS)
	}
	
	def agregarJugador(Jugador jugador){
		jugadoresService.insertPlayer(jugador,JugadoresService.ACCEPTED_PLAYERS)
	}
	
	def void agregarJugadores(List<Jugador> jugadores){
		jugadores.forEach[jugador | this.agregarJugador(jugador)]
	}
	

	def rechazarInteresado(Jugador interesado, String motivo) {
		eliminarInteresado(interesado)
		jugadoresService.agregarJugadorDenegado(new Denegacion(interesado, LocalDateTime.now, motivo))
	}

	def getJugador(Long id) {
		jugadoresService.getPlayer(id,JugadoresService.ACCEPTED_PLAYERS)
		//interesadosAceptados.findFirst[jugador|jugador.id.equals(id)]
	}
	
	def getJugadores() {
		return jugadoresService.getAllPlayers(JugadoresService.ACCEPTED_PLAYERS)
	}
	
	def getJugadores(Jugador jugadorBusqueda) {
		val nombreBusqueda = jugadorBusqueda.nombre.toLowerCase()

		interesadosAceptados.filter [ jugador |
			jugador.nombre.toLowerCase().startsWith(nombreBusqueda) ||
				jugador.apodo.toLowerCase().contains(jugadorBusqueda.apodo.toLowerCase()) ||
				jugador.fechaNacimiento.isAfter(jugadorBusqueda.fechaNacimiento)
		]

	}
}
