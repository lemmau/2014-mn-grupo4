package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Partido

class Estandar extends TipoDeInscripcion {

	val Integer prioridad = 1
	
	override estasConfirmado(Partido partido){
		return true		
	}
	
	override Integer getPrioridad(){
		return this.prioridad
	}
	
}
