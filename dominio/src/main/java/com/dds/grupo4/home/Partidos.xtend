package com.dds.grupo4.home

import com.dds.grupo4.divisorequipos.DivisorDeEquipos
import com.dds.grupo4.dominio.Inscripcion
import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.ordenamiento.CriterioOrden
import java.util.ArrayList
import java.util.List

class Partidos {
	@Property private List<Partido> partidos = new ArrayList<Partido>

	/** singleton **/
	static Partidos instance

	private new() {
		partidos = new ArrayList<Partido>
	}

	static def getInstance() {
		if (instance == null) {
			instance = new Partidos()
		}
		instance
	}

	/** fin singleton **/
	def ultimoIdUtilizado() {

		if (partidos.isEmpty) {
			return 1
		}
		return partidos.sortBy[-it.id].toList.get(0).id.intValue
	}

	def agregarPartido(Partido partido) {
		partido.id = new Long(this.ultimoIdUtilizado.longValue + 1)
		partidos.add(partido)
	}

	def quitarPartido(Partido partido) {
		partidos.remove(partido)
	}

	def getPartido(Long id) {
		partidos.findFirst[partido|partido.id.equals(id)]

	}

	def generarEquipo(Partido partido, CriterioOrden criterioOrden, DivisorDeEquipos criterioSeleccion) {
		var List<Inscripcion> resultado = new ArrayList

		partido.agregarCriterioOrdenamiento(criterioOrden)
		resultado = partido.ordenarJugadoresFinales
		resultado = criterioSeleccion.dividirEnEquipos(resultado)

		return resultado
	}

	def partidosxJugador(Jugador jugador) {
		partidos.filter[partido|partido.esUnJugadorFinal(jugador)]
	}
	
	def getAllPartidos(){
		return partidos
	}

	def borrarTodo() {
		partidos = new ArrayList<Partido>
	}

}
