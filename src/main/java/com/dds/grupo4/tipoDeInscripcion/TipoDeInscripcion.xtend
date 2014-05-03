package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Interesado
import com.dds.grupo4.Partido
import com.google.common.base.Predicate

abstract class TipoDeInscripcion {
	
	def void inscribime(Interesado interesado,Partido partdio);
	
	def Boolean sosEstandar(){
		return Boolean.FALSE
	}
	
	def Predicate<Interesado> getCondicionDelPartido(){
		return null;
	}
	
		
}