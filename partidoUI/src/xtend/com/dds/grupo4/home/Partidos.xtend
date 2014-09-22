package com.dds.grupo4.home

import com.dds.grupo4.dominio.Partido
import java.util.List
import java.util.ArrayList
import com.dds.grupo4.dominio.Jugador

class Partidos {
	
	 List<Partido> partidos = new ArrayList<Partido>


	/** singleton **/
	static Partidos instance

	private new() {
		partidos = new ArrayList<Partido>
	}

	static def getInstance() {
		if(instance == null) {
			instance = new Partidos()
		}
		instance
	}

	/** fin singleton **/



	def agregarPartido(Partido partido) {
		partido.id = new Long(this.ultimoIdUtilizado.longValue + 1)
		partidos.add(partido)
	}
	
	def ultimoIdUtilizado() {
		if (partidos.isEmpty) {
			return 1
		}
		return partidos.sortBy [ -it.id ].toList.get(0).id.intValue
	}

	def quitarPartido(Partido partido) {
		partidos.remove(partido)
	}

	def partidosxJugador(Jugador jugador) {
		partidos.filter[partido|partido.esUnJugadorFinal(jugador)]
	}

	def  Partido getPartido(Long id){
		partidos.findFirst[partido|partido.id.equals(id)]
	}
	def getPartidos(){
	  partidos
	}
}
