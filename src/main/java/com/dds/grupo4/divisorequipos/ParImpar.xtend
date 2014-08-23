package com.dds.grupo4.divisorequipos

import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.dominio.Jugador
import java.util.List
import com.dds.grupo4.dominio.Inscripcion

class ParImpar extends DivisorDeEquipos {

	new(Partido partido) {
		super(partido)
	}

	def Boolean isEven(Integer number) {
		return number % 2 == 0
	}
	
	override debeIrAlEquipoUno(Jugador interesado,List<Inscripcion> interesados){
		return isEven(interesados.indexOf(interesado))
	}

}
