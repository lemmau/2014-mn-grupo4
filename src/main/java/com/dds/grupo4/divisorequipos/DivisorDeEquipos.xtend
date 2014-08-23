package com.dds.grupo4.divisorequipos

import java.util.List

import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.dominio.Inscripcion
import com.dds.grupo4.dominio.Jugador

abstract class DivisorDeEquipos {
	
	Partido partido
	
	new(Partido partido){
		this.partido = partido
	}
	
	def void dividirEnEquipos(){
		val List<Inscripcion> interesados = partido.getInscripciones
		
		interesados.forEach [ interesado |
			if (debeIrAlEquipoUno(interesado.jugador,interesados)) {
				partido.agregarJugadorEquipoA(interesado)
			} else {
				partido.agregarJugadorEquipoB(interesado)
			}
		]	
	}
	
	def abstract Boolean debeIrAlEquipoUno(Jugador jugador,List<Inscripcion> interesados)
	
	
}