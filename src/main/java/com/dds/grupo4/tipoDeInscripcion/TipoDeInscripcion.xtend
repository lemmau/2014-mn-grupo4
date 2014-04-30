package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Interesado
import com.dds.grupo4.Partido

interface TipoDeInscripcion {
	
	def Inscripciones tipoInscripcion()
	
	def void inscribime(Interesado interesado,Partido partdio);
	
	
		
	
}