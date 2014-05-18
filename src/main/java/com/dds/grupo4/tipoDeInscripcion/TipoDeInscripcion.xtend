package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Interesado
import com.dds.grupo4.Partido
import java.util.List

abstract class TipoDeInscripcion {
	
	def Boolean estasConfirmado(Partido partido)
	
	def (List<Interesado>) => Boolean getCondicionDelPartido(){
		return null;
	}
	
	def Integer getPrioridad()
}