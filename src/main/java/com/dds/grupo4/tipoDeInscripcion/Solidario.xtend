package com.dds.grupo4.tipoDeInscripcion

class Solidario extends TipoDeInscripcion {
	
	Integer prioridad = 2
	
	override Integer getPrioridad(){
		return this.prioridad
	}
}
