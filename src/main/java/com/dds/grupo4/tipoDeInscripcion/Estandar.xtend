package com.dds.grupo4.tipoDeInscripcion

class Estandar extends TipoDeInscripcion {

	Integer prioridad = 1

	override Integer getPrioridad(){
		return this.prioridad
	}
}
