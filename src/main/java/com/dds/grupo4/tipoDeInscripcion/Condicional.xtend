package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.dominio.Partido

class Condicional extends TipoDeInscripcion {
	
	final Integer PRIORIDAD_CONDICIONAL = 3

	(Partido) => Boolean condicionDelPartido;

	new((Partido) => Boolean predicate){
		this.condicionDelPartido = predicate
	}
	
	override estasConfirmado(Partido partido) {
		return this.condicionDelPartido.apply(partido)
	}
	
	override Integer getPrioridad(){
		return PRIORIDAD_CONDICIONAL
	}

}
