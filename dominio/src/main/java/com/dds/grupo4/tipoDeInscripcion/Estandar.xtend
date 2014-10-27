package com.dds.grupo4.tipoDeInscripcion

class Estandar extends TipoDeInscripcion {

	final Integer PRIORIDAD_ESTANDAR = 1

	override Integer getPrioridad(){
		return PRIORIDAD_ESTANDAR
	}
	
	override def String toString(){
		"ESTANDAR"
	}
	
	override def nombreCondicion() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
