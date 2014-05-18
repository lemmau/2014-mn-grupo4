package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Interesado
import com.dds.grupo4.Partido
import java.util.List

class Condicional extends TipoDeInscripcion {
	
	(List<Interesado>) => Boolean condicionDelPartido;

	override inscribime(Interesado interesado, Partido partido) {
		partido.inscribirCondicional(interesado)
	}
	
	new((List<Interesado>) => Boolean predicate){
		this.condicionDelPartido = predicate
	}
	
	override
	def (List<Interesado>) => Boolean getCondicionDelPartido(){
		return this.condicionDelPartido
	}


}
