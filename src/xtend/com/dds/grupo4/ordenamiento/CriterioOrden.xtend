package com.dds.grupo4.ordenamiento

import com.dds.grupo4.dominio.Inscripcion
import com.dds.grupo4.dominio.Partido
import java.util.List

abstract class CriterioOrden {
	

	def ordenarJugadoresFinales(Partido partido) {
		partido.jugadoresFinales.sortBy [ inscripcion |
				obtenerPromedioPorInscripcion(inscripcion, partido.criteriosOrden)
			]
	}
	
	def Double obtenerValorPorInscripcion(Inscripcion inscripcion, List<CriterioOrden> criteriosOrden) {
		//this.criteriosOrden.map[c|c.obtenerValor(inscripcion)].reduce[p1, p2|p1 + p2]]
		criteriosOrden.fold(0D) [ result, criterio | result + criterio.obtenerValor(inscripcion) ]
	}

	def obtenerPromedioPorInscripcion(Inscripcion inscripcion, List<CriterioOrden> criteriosOrden) {
		obtenerValorPorInscripcion(inscripcion, criteriosOrden)/criteriosOrden.size
	}

	def Double obtenerValor(Inscripcion inscripcion)
	
}