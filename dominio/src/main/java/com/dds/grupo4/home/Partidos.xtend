package com.dds.grupo4.home

import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.service.PartidoService
import com.dds.grupo4.connector.DataBaseConnector
import java.util.List
import com.dds.grupo4.service.JugadoresService
import com.dds.grupo4.divisorequipos.DivisorDeEquipos
import com.dds.grupo4.ordenamiento.CriterioOrden
import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.dominio.Inscripcion

class Partidos {
	//@Property private List<Partido> partidos = new ArrayList<Partido>
	private PartidoService partidoService
	private JugadoresService jugadoresService
	private static String dataBaseName = "futbol5"

	/** singleton **/
	static Partidos instance

	private new(PartidoService service,JugadoresService jservice) {
		//partidos = new ArrayList<Partido>
		partidoService = service
		jugadoresService = jservice
	}

	static def getInstance() {
		val DataBaseConnector connector = new DataBaseConnector(dataBaseName)
		if (instance == null) {
			val JugadoresService jservice = new JugadoresService(connector)
			val PartidoService service = new PartidoService(connector)
			instance = new Partidos(service,jservice)
		}
		instance
	}

	/** fin singleton **/
	def agregarPartido(Partido partido) {
		partidoService.insertarPartido(partido)
		//partidos.add(partido)
	}

	def getPartido(Long id) {
		partidoService.getPartido(id)
		//partidos.findFirst[partido|partido.id.equals(id)]

	}
	
	def void confirmarEquipos(Long partidoId,List<Long> jugadoresId){
		val partido = partidoService.getPartido(partidoId)
		val jugadores = jugadoresService.getPlayers(jugadoresId)
		partido.confirmarEquipos(jugadores)
		partidoService.updateMatch(partido)
	}
	
	def List<Inscripcion> generarEquipos(Partido partido,DivisorDeEquipos divisor,List<CriterioOrden> orden){
		val List<Jugador> jugadoresCompletos = jugadoresService.getPlayers(partido.inscripciones.map[ins | ins.jugador.id])
		partido.inscripciones.forEach[ins | ins.setJugador(jugadoresCompletos.findFirst[jug | jug.id == ins.jugador.id])]
		partido.generarEquipo(divisor,orden)
	}

	def getAllPartidos() {
		partidoService.getPartidos
		//return partidos
	}

	def borrarTodo() {
		partidoService.eliminarTodo
		//partidos = new ArrayList<Partido>
	}
	
	def void imprimirPartidos(){
		partidoService.showMatches
	}

}
