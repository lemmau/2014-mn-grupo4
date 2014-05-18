package com.dds.grupo4.observers

import com.dds.grupo4.Partido
import java.util.List
import com.dds.grupo4.Interesado
import com.google.common.collect.Lists
import com.dds.grupo4.helper.MailHelper

class NotificarBaja implements PartidoObservador {

	val private static NUEVE_JUGADORES_ESTANDARES = 9

	override notificar(Partido partido, Interesado interesado) {
		if (!partido.esUnInteresado(interesado)) {

			val List<Interesado> interesados = partido.getInteresados

			if (interesado.sosEstandar && interesados.filter[inte|inte.sosEstandar].size.equals(NUEVE_JUGADORES_ESTANDARES)) {
				MailHelper.sendMail("someMail", "pass", Lists.newArrayList(partido.getAdmin.getMail), "subject",
					"Se agrego un interesado a la lista")
			}

		}
	}

}
