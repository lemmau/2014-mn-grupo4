package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Interesado
import com.dds.grupo4.Partido
import java.util.List

abstract class TipoDeInscripcion {
	
	def void inscribime(Interesado interesado,Partido partdio);
	
	def Boolean estasConfirmado(Partido partido)
	
	def Boolean sosEstandar(){
		return Boolean.FALSE
	}
	
	def (List<Interesado>) => Boolean getCondicionDelPartido(){
		return null;
	}
	
		
}