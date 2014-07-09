package com.dds.grupo4.ordenamiento

import com.dds.grupo4.Inscripcion

class PromedioUltimasCalificaciones extends CriterioOrden {

	Integer numeroCalificaciones = 5

	new (Integer numeroCalificaciones) {
		this.numeroCalificaciones = numeroCalificaciones
	}

	override obtenerValor(Inscripcion inscripcion) {
		inscripcion.promedioUltimasCalificaciones(numeroCalificaciones)
	}
}
