package com.dds.grupo4.divisorequipos

import java.util.List

import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.dominio.Inscripcion

abstract class DivisorDeEquipos {
	
	Partido partido
	
	new(Partido partido){
		this.partido = partido
	}
	
	def void dividirEnEquipos(List<Inscripcion> jugadores){
		//val List<Inscripcion> interesados = partido.getInscripciones
		
		jugadores.forEach [ interesado |
			if (debeIrAlEquipoUno(interesado, jugadores)) {
				partido.agregarJugadorEquipoA(interesado)
			} else {
				partido.agregarJugadorEquipoB(interesado)
			}
		]	
	}
	
	def abstract Boolean debeIrAlEquipoUno(Inscripcion jugador,List<Inscripcion> interesados)
	
	
}