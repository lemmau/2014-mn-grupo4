package com.dds.grupo4.tipoDeInscripcion

class Solidario extends TipoDeInscripcion {
	
	final Integer PRIORIDAD_SOLIDARIO = 2
	
	override Integer getPrioridad(){
		return PRIORIDAD_SOLIDARIO
	}
	
	override def String toString(){
		"SOLIDARIO"
	}
	
	override nombreCondicion() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
