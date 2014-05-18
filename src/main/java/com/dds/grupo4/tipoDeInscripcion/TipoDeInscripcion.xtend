package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Partido

abstract class TipoDeInscripcion {
	
	@Property Integer prioridad
	
	def Boolean estasConfirmado(Partido partido) {
		return false
	}
	
	def (Partido) => Boolean getCondicionDelPartido(){
		return null
	}
	
	def Integer getPrioridad(){
		return this.prioridad
	}
	
}