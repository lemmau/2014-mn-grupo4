package com.dds.grupo4.ordenamiento

import com.dds.grupo4.ordenamiento.CriterioOrden
import com.dds.grupo4.Inscripcion

class PromedioCalificaciones extends CriterioOrden {

	Integer numeroCalificaciones = 5
	
	override obtenerValor(Inscripcion inscripcion) {
		inscripcion.promedioUltimasCalificaciones(numeroCalificaciones)
	}
}
