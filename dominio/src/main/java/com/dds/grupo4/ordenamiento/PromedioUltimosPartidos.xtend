package com.dds.grupo4.ordenamiento

import java.util.ArrayList
import java.util.List

import com.dds.grupo4.ordenamiento.CriterioOrden
import com.dds.grupo4.dominio.Inscripcion
import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.home.Partidos

class PromedioUltimosPartidos extends CriterioOrden {

	Integer numeroCalificaciones = 5
	List<Partido> partidos = new ArrayList

	new (Integer numeroPartidos) {
		this.partidos = Partidos.getInstance.allPartidos	
		this.numeroCalificaciones = numeroPartidos
	}
	
	new () {
		this.partidos = Partidos.getInstance.allPartidos	
	}

	override obtenerValor(Inscripcion inscripcion) {
		val Iterable<Partido> filtrado = partidos.filter[p | p.esUnInteresado(inscripcion.jugador)].take(numeroCalificaciones)
		filtrado
		.map[partido| partido.obtenerInscripcion(inscripcion.jugador)]
		.map[promedioCalificaciones]
		.reduce[p1, p2| p1 + p2] / filtrado.size
	}
	
	override toString() {
		"promediosUltimosPartidos"
	}
	
}
