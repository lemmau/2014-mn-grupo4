package com.dds.grupo4.observers

import com.dds.grupo4.Partido
import com.dds.grupo4.helper.MailHelper
import com.google.common.collect.Lists
import com.dds.grupo4.Interesado

class NotificarAdmin implements PartidoObservador {

	override notificar(Partido partido, Interesado interesado) {
		if (partido.esUnInteresado(interesado)) {
			val String message = "Se agrego a ".concat(interesado.getNombre).concat(" a la lista de interesados")
			MailHelper.sendMail("someMail", "pass", Lists.newArrayList(partido.getAdmin.getMail), "subject", message)
		}
	}

}
