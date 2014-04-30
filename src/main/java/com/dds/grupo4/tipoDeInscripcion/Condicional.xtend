package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Interesado
import com.dds.grupo4.Partido

class Condicional implements TipoDeInscripcion {
	
	override 
	inscribime(Interesado interesado,Partido partido) {
		
		if(this.cumpleConCondicionDelPartido(partido)){
			partido.interesados.add(interesado);	
		}
			
				
	}
	
	def cumpleConCondicionDelPartido(Partido partido){
		//UNA CONDICION PARA EL TIPO DE INSCRIPCION CONDICIONAL
		return (partido.interesados.filter[ interesado | interesado.edad < 20].size) < 6;
	}
	
	override 
	Inscripciones tipoInscripcion(){
		return Inscripciones.CONDICIONAL;
	}
	
}