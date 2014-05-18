package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Interesado
import com.dds.grupo4.Partido

class Estandar extends TipoDeInscripcion {

	override inscribime(Interesado interesado, Partido partido) {
		partido.inscribirEstandar(interesado)
		interesado.partidosALosQueMeInscribi.add(partido)
	}

	override estasConfirmado(Partido partido){
		
		return true		
	} 
	
	
	
	
	//	override
//	def Boolean sosEstandar(){
//		return Boolean.TRUE
//	}
}
