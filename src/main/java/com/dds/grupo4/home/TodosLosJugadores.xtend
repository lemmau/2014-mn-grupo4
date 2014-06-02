package com.dds.grupo4.home

import java.util.List
import com.dds.grupo4.Interesado
import java.util.ArrayList

class TodosLosJugadores {
 	private static List<Interesado> interesadosDelSistema = new ArrayList<Interesado>
 	
 	def static agregarPosibleInteresado(Interesado interesado) {
 		interesadosDelSistema.add(interesado)
 	}
  
  	def static eliminarPosibleInteresado(Interesado interesado) {
 		interesadosDelSistema.remove(interesado)
 	}
 	
 	def static esUnInteresadoDelSistema(Interesado interesado){
 		interesadosDelSistema.contains(interesado)
 	}
 	
 	def static agregarJugadorAlSistema(Interesado interesado) {
 		interesadosDelSistema.add(interesado)
 	}
 	
 	def static List<Interesado> getInteresadosDelSistema(){
 		interesadosDelSistema
  	}
}