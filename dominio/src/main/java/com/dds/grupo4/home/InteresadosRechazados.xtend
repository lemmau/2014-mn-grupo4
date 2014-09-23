package com.dds.grupo4.home

import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.dominio.Denegacion
import java.util.List
import java.util.ArrayList
import org.joda.time.LocalDateTime

class InteresadosRechazados {
	
	private List<Denegacion> interesadosRechazados = new ArrayList<Denegacion>
	
	def esUnInteresadoRechazado(Jugador interesado) {
		interesadosRechazados.exists[rechazado | rechazado.interesado.equals(interesado)]
	}

	def getInteresadosRechazados() {
		interesadosRechazados.clone
	}

	def Integer getCantInteresadosRechazados() {
		interesadosRechazados.size
	}

	def void agregarRechazado(Jugador interesado, String motivo){
		interesadosRechazados.add(new Denegacion(interesado, LocalDateTime.now, motivo))
	}

}