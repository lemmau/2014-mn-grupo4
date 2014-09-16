package com.dds.grupo4.home

import com.dds.grupo4.dominio.Partido
import java.util.List
import java.util.ArrayList
import com.dds.grupo4.dominio.Jugador

class Partidos {
	@Property private List<Partido> partidos = new ArrayList<Partido>

	def agregarPartido(Partido partido) {
		partidos.add(partido)
	}

	def quitarPartido(Partido partido) {
		partidos.remove(partido)
	}

	def partidosxJugador(Jugador jugador) {
		partidos.filter[partido|partido.esUnJugadorFinal(jugador)]
	}

}
