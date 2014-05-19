package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Partido

class Solidario extends TipoDeInscripcion {
	
	Integer prioridad = 2
	
	override estasConfirmado(Partido partido) {
		return Boolean.TRUE
	}
	
	override getPrioridad(){
		return this.prioridad	
	}

}
