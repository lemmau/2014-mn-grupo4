package com.dds.grupo4.tipoDeInscripcion

class Estandar extends TipoDeInscripcion {

	final Integer PRIORIDAD_ESTANDAR = 1

	override Integer getPrioridad(){
		return PRIORIDAD_ESTANDAR
	}
}
