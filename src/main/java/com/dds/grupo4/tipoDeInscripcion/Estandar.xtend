package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Interesado
import com.dds.grupo4.Partido

class Estandar implements TipoDeInscripcion{
		
	val static final PRIMERA_POSICION = Integer.valueOf(0);
	
	new(){
		
	}
	
	override 
	inscribime(Interesado interesado,Partido partido) {
		
		partido.interesados.add(PRIMERA_POSICION,interesado);
									
	}
	
	override
	Inscripciones tipoInscripcion(){
		return Inscripciones.ESTANDAR
	}
	
	
	
}