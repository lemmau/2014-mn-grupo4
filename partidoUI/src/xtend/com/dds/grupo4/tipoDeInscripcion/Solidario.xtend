package com.dds.grupo4.tipoDeInscripcion

class Solidario extends TipoDeInscripcion {
	
	final Integer PRIORIDAD_SOLIDARIO = 2
	
	override Integer getPrioridad(){
		return PRIORIDAD_SOLIDARIO
	}
}
