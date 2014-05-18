package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Interesado
import com.dds.grupo4.Partido
import java.util.List

class Condicional extends TipoDeInscripcion {
	
	Integer prioridad = 3
	
	(List<Interesado>) => Boolean condicionDelPartido;

	new((List<Interesado>) => Boolean predicate){
		this.condicionDelPartido = predicate
	}
	
	override
	def (List<Interesado>) => Boolean getCondicionDelPartido(){
		return this.condicionDelPartido
	}
	
	override estasConfirmado(Partido partido) {
		return false
	}
	
	override getPrioridad(){
		return this.prioridad
	}


}
