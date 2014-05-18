package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Partido

abstract class TipoDeInscripcion {
	
	def Boolean estasConfirmado(Partido partido)
	
	def (Partido) => Boolean getCondicionDelPartido(){
		return null;
	}
	
	def Integer getPrioridad()
}