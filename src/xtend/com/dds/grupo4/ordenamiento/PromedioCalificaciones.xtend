package com.dds.grupo4.ordenamiento

import com.dds.grupo4.ordenamiento.CriterioOrden
import com.dds.grupo4.dominio.Inscripcion

class PromedioCalificaciones extends CriterioOrden {

	override obtenerValor(Inscripcion inscripcion) {
		inscripcion.promedioCalificaciones
	}
}
