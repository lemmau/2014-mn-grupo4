package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Interesado
import com.dds.grupo4.Partido
import com.google.common.base.Predicate

class Condicional extends TipoDeInscripcion {
	
	@Property Predicate<Interesado> condicionDelPartido;

	override inscribime(Interesado interesado, Partido partido) {

		partido.inscribirCondicional(interesado)

	}
	
	new(Predicate<Interesado> predicate){
		this.setCondicionDelPartido(predicate);	
		
	}
	
	override
	def Predicate<Interesado> getCondicionDelPartido(){
		return this.condicionDelPartido
	}


}
