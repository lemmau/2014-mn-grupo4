package com.dds.grupo4.ordenamiento

import java.util.ArrayList
import java.util.List

import com.dds.grupo4.ordenamiento.CriterioOrden
import com.dds.grupo4.dominio.Inscripcion
import com.dds.grupo4.dominio.Partido

class PromedioUltimosPartidos extends CriterioOrden {

	Integer numeroCalificaciones = 5
	List<Partido> partidos = new ArrayList

	new (List<Partido> partidos, Integer numeroPartidos) {
		this.partidos = partidos
		this.numeroCalificaciones = numeroPartidos
	}

	override obtenerValor(Inscripcion inscripcion) {
		val Iterable<Partido> filtrado = partidos.filter[p | p.esUnInteresado(inscripcion.jugador)].take(numeroCalificaciones)
		filtrado
		.map[partido| partido.obtenerInscripcion(inscripcion.jugador)]
		.map[promedioCalificaciones]
		.reduce[p1, p2| p1 + p2] / filtrado.size
	}
}
