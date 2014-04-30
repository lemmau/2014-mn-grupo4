package com.dds.grupo4

import com.dds.grupo4.tipoDeInscripcion.Condicional
import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.tipoDeInscripcion.Solidaria

class Admin {
	
	
	def static void main(String[] args){
		
		val diego = new Interesado("Diego","Anazonian",22,new Condicional);
		val osvac = new Interesado("Osvaldo","Corneli",22,new Estandar);
		val leandro = new Interesado("Leandro","Mauro",32,new Solidaria);
				
		val partido = new Partido;
		
		partido.inscribirA(diego);
		partido.inscribirA(osvac);
		partido.inscribirA(leandro);
	
	}
	
}