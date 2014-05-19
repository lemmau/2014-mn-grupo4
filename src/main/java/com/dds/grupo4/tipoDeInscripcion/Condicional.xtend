package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Partido

class Condicional extends TipoDeInscripcion {
	
	Integer prioridad = 3
	(Partido) => Boolean condicionDelPartido;

	new((Partido) => Boolean predicate){
		this.condicionDelPartido = predicate
	}
	
	override estasConfirmado(Partido partido) {
		return this.condicionDelPartido.apply(partido)
	}
	
	override Integer getPrioridad(){
		return this.prioridad
	}

}
