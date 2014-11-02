package com.dds.grupo4.home

import com.dds.grupo4.dominio.Partido
import java.util.ArrayList
import java.util.List
import com.dds.grupo4.service.PartidoService
import com.dds.grupo4.connector.DataBaseConnector

class Partidos {
	//@Property private List<Partido> partidos = new ArrayList<Partido>
	private PartidoService partidoService
	private static String dataBaseName = "futbol5"

	/** singleton **/
	static Partidos instance

	private new(PartidoService service) {
		//partidos = new ArrayList<Partido>
		partidoService = service
	}

	static def getInstance() {
		if (instance == null) {
			//TODO 
			val PartidoService service = new PartidoService(new DataBaseConnector(dataBaseName))
			instance = new Partidos(service)
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

	def getAllPartidos() {
		partidoService.partidos
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
