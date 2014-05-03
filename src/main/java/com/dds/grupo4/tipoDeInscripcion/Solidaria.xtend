package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Interesado
import com.dds.grupo4.Partido

class Solidaria extends TipoDeInscripcion {

	override inscribime(Interesado interesado, Partido partido) {
		partido.inscribirSolidario(interesado)
	}

}
