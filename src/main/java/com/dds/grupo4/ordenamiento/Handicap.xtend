package com.dds.grupo4.ordenamiento

import com.dds.grupo4.Inscripcion

class Handicap extends CriterioOrden {
	
	override obtenerValor(Inscripcion inscripcion) {
		inscripcion.jugador.handicap
	}
	
}