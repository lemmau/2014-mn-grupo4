package com.dds.grupo4.divisorequipos

import com.dds.grupo4.dominio.Inscripcion
import com.dds.grupo4.dominio.Partido
import java.util.List

class NumerosFijos extends DivisorDeEquipos {

	val NUMEROS_FIJOS = #[1, 4, 5, 8, 9].toList

	new(Partido partido) {
		super(partido);
	}

	override Boolean debeIrAlEquipoUno(Inscripcion jugador, List<Inscripcion> interesados) {
		return NUMEROS_FIJOS.contains(interesados.indexOf(jugador))
	}

}
