package com.dds.grupo4.tipoDeInscripcion

import com.dds.grupo4.Interesado
import com.dds.grupo4.Partido
import java.util.Iterator

class Solidaria implements TipoDeInscripcion {

	override inscribime(Interesado interesado, Partido partido) {

		val Interesado interesadoEstandar = partido.interesados.findLast[inte|
			inte.tipoDeInscripcion.tipoInscripcion.equals(Inscripciones.ESTANDAR)];
			
		partido.interesados.add(partido.interesados.lastIndexOf(interesadoEstandar) + 1, interesado);

	}

	override Inscripciones tipoInscripcion() {
		return Inscripciones.SOLIDARIA;
	}

}
