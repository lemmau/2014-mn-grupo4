package com.dds.grupo4.divisorequipos

import java.util.List
import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.dominio.Inscripcion
import com.dds.grupo4.dominio.Jugador

class NumerosFijos extends DivisorDeEquipos {

	val NUMEROS_FIJOS = #[1, 4, 5, 8, 9].toList

	new(Partido partido) {
		super(partido);
	}

	override Boolean debeIrAlEquipoUno(Jugador jugador, List<Inscripcion> interesados) {
		return NUMEROS_FIJOS.contains(interesados.indexOf(jugador))
	}

}
