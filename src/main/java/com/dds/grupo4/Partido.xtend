package com.dds.grupo4

import java.util.List
import org.joda.time.DateTime
import com.dds.grupo4.tipoDeInscripcion.Inscripciones
import java.util.ArrayList
import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion

class Partido {
	
	val private static MAX_CANTIDAD_JUGADORES = Integer.valueOf(10);
	@Property DateTime fechaInicio;
	@Property List<Interesado> interesados;
	@Property List<Interesado> resagados;
	
	def void inscribirA(Interesado interesado){
		
		var cantInteresados = this.interesados.filter[ inte | inte.tipoDeInscripcion.tipoInscripcion.equals(Inscripciones.ESTANDAR)].size ;
		
		if(cantInteresados <= MAX_CANTIDAD_JUGADORES){
		
			interesado.inscribite(this);	
							
		}	
		
	}
		
	
	new(){
		
		interesados = new ArrayList;
		
	}
	
	
	
}