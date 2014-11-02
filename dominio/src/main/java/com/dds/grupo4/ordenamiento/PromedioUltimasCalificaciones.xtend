package com.dds.grupo4.ordenamiento

import com.dds.grupo4.dominio.Inscripcion

class PromedioUltimasCalificaciones extends CriterioOrden {

	Integer numeroCalificaciones = 5

	new (Integer numeroCalificaciones) {
		this.numeroCalificaciones = numeroCalificaciones
	}
	
	new(){
		
	}

	override obtenerValor(Inscripcion inscripcion) {
		inscripcion.promedioUltimasCalificaciones(numeroCalificaciones)
	}
	
	override toString() {
		"promedioUltimasCalificaciones"
	}
	
}
