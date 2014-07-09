package com.dds.grupo4.home

import com.dds.grupo4.Interesado
import com.dds.grupo4.Denegacion
import java.util.List
import java.util.ArrayList
import java.time.LocalDateTime


class InteresadosRechazados {
	
	private List<Denegacion> interesadosRechazados = new ArrayList<Denegacion>
	
	def esUnInteresadoRechazado(Interesado interesado) {
		interesadosRechazados.exists[rechazado | rechazado.interesado.equals(interesado)]
	}

	def getInteresadosRechazados() {
		interesadosRechazados.clone
	}

	def Integer getCantInteresadosRechazados() {
		interesadosRechazados.size
	}

	def void agregarRechazado(Interesado interesado, String motivo){
		interesadosRechazados.add(new Denegacion(interesado, LocalDateTime.now, motivo))
	}

}