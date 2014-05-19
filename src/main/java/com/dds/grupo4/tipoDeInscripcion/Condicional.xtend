package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Partido

class Condicional extends TipoDeInscripcion {
	
	Integer prioridad = 3
	
	(Partido) => Boolean condicionDelPartido;

	new((Partido) => Boolean predicate){
		this.condicionDelPartido = predicate
	}
	
	def (Partido) => Boolean getCondicionDelPartido(){
		return this.condicionDelPartido
	}
	
	override estasConfirmado(Partido partido) {
		return this.getCondicionDelPartido.apply(partido)
	}
	
	override getPrioridad(){
		return this.prioridad
	}


}
