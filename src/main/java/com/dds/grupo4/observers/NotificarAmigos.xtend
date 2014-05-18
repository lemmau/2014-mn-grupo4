package com.dds.grupo4.observers

import com.dds.grupo4.Interesado
import com.dds.grupo4.Partido
import com.dds.grupo4.helper.MailHelper
import com.google.common.collect.Lists

class NotificarAmigos implements PartidoObservador {

	override notificar(Partido partido, Interesado interesado) {
		if (partido.esUnInteresado(interesado)) {

			interesado.getAmigos.forEach[amigo|this.notificarA(interesado, amigo)]
		}
	}

	def void notificarA(Interesado interesado, Interesado amigo) {
		MailHelper.sendMail(
			interesado.getMail,
			interesado.getPassword,
			Lists.newArrayList(amigo.getMail),
			"subject",
			"Tu amigo se ha suscripto a la lista de interesados del partido"
		)
	}

}
