package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Partido

abstract class TipoDeInscripcion {
	
	def Boolean estasConfirmado(Partido partido){
		return Boolean.TRUE
	}
	
	def Integer getPrioridad()
}