package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.dominio.Partido

class Condicional extends TipoDeInscripcion {
	
	final Integer PRIORIDAD_CONDICIONAL = 3
	@Property String CONDICION_NOMBRE 

	(Partido) => Boolean condicionDelPartido;

	new((Partido) => Boolean predicate,String nombre){
		this.condicionDelPartido = predicate
		this.CONDICION_NOMBRE = nombre
	}
	
	new(String nombreCondicion){
		this.CONDICION_NOMBRE = nombreCondicion
		this.condicionDelPartido = Condicion.CONDICIONES.get(nombreCondicion)
	}
	
	override estasConfirmado(Partido partido) {
		return this.condicionDelPartido.apply(partido)
	}
	
	override Integer getPrioridad(){
		return PRIORIDAD_CONDICIONAL
	}
	
	override def String toString(){
		"CONDICIONAL"
	}
	
	override nombreCondicion() {
		this.CONDICION_NOMBRE
	}

}
