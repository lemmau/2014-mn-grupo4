package com.dds.grupo4.divisorequipos

import com.dds.grupo4.dominio.Inscripcion
import com.dds.grupo4.dominio.Partido
import java.util.List

class ParImpar extends DivisorDeEquipos {

	new(Partido partido) {
		super(partido)
	}

	def Boolean isEven(Integer number) {
		return number % 2 == 0
	}
	
	override debeIrAlEquipoUno(Inscripcion interesado,List<Inscripcion> interesados){
		return isEven(interesados.indexOf(interesado))
	}

}
