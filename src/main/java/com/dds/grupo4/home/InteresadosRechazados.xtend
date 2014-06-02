package com.dds.grupo4.home

import com.dds.grupo4.Interesado
import java.util.List
import java.util.ArrayList

class InteresadosRechazados {
	
	private static List<Interesado> interesadosRechazados = new ArrayList<Interesado>
	
	def static getInteresadosRechazados() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def static esUnInteresadoRechazado(Interesado interesado){
		interesadosRechazados.contains(interesado)
	}
	
	def static agregarInteresado(Interesado interesado) {
		interesadosRechazados.add(interesado)
	}
	
}