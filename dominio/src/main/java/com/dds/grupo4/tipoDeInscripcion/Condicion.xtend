package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.dominio.Partido
import java.util.Map
import com.google.common.collect.ImmutableMap

class Condicion {
	
	public val static final String MAS_DE_DOS_JUGADORES_MAYORES_A_22 = "masDeDosJugadoresMayoresA22"
	public val static final String EL_DIA_DEL_MES_DEBE_SER_21 = "elDiaDelMesDebeSer21"
	
	public val static Map<String, (Partido)=>Boolean> CONDICIONES = ImmutableMap.of(
		MAS_DE_DOS_JUGADORES_MAYORES_A_22,
		masDeDosJugadoresMayoresA22,
		EL_DIA_DEL_MES_DEBE_SER_21,
		elDiaDelMesDebeSer21
	)

	def private static (Partido)=>Boolean masDeDosJugadoresMayoresA22() {
		[Partido partido|partido.inscripciones.filter[inscripcion|inscripcion.jugador.edad > 22].size > 2]
	}

	def private static (Partido)=>Boolean elDiaDelMesDebeSer21() {
		[Partido partido|(partido.fechaInicio.getDayOfMonth.equals(21))]
	}

}
