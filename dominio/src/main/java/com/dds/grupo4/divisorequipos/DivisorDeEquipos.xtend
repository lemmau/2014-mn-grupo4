package com.dds.grupo4.divisorequipos

import java.util.List

import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.dominio.Inscripcion
import java.util.ArrayList

abstract class DivisorDeEquipos {
	
	Partido partido
	
	new(Partido partido){
		this.partido = partido
	}
	
	def dividirEnEquipos(List<Inscripcion> jugadores){
		val List<Inscripcion> equipoA = new ArrayList
		val List<Inscripcion> equipoB = new ArrayList
		
		jugadores.forEach [ interesado |
			if (debeIrAlEquipoUno(interesado, jugadores)) {
				equipoA.add(interesado)
			} else {
				equipoB.add(interesado)
			}
		]	
		
		equipoA.addAll(equipoB)
		return equipoA
	}
	
	def abstract Boolean debeIrAlEquipoUno(Inscripcion jugador,List<Inscripcion> interesados)
	
	
}