package com.dds.grupo4.observers

import com.dds.grupo4.Partido
import java.util.List
import com.dds.grupo4.Interesado
import com.google.common.collect.Lists
import com.dds.grupo4.helper.MailHelper

class NotificarBaja implements PartidoObservador {

	val private static NUEVE_JUGADORES_ESTANDARES = 9

	override notificar(Partido partido, Interesado interesado) {
	}

}
