package com.dds.grupo4.ordenamiento

import com.dds.grupo4.dominio.Inscripcion
import com.dds.grupo4.dominio.Partido


abstract class CriterioOrden {
	
	def ordenarJugadoresFinales(Partido partido) {
		partido.jugadoresFinales.sortBy[inscripcion|
			//this.criteriosOrden.map[c|c.obtenerValor(inscripcion)].reduce[p1, p2|p1 + p2]]
			partido.criteriosOrden.fold(0D) [ result, criterio | result + criterio.obtenerValor(inscripcion) ]
			]
	}

	def Double obtenerValor(Inscripcion inscripcion)
	
}