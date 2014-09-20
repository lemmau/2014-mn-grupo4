package com.dds.grupo4.observadores

import com.dds.grupo4.observadores.InscripcionObserver
import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.mail.MailSender
import com.dds.grupo4.dominio.Inscripcion

class PartidoConfirmado extends InscripcionObserver {

	new(Partido partido, MailSender mailSender) {
		super(partido, mailSender)
	}

	override notificarNuevaInscripcion(Inscripcion inscripcion) {
		if (partido.cantidadInteresados == 10) {
			// notificar Partido Confirmado al admin.
			enviarMail("sistema@ddsutn.com", partido.admin.mail, "Partido Confirmado",
				"El partido de la fecha " + partido.fechaInicio + " tiene 10 jugadores");
		}
	}

	override notificarBajaInscripcion() {
		// TODO validar que antes estaba confirmado el partido.
		if (partido.cantidadInteresados < 10) {
			enviarMail("sistema@ddsutn.com", partido.admin.mail, "Partido Menos 10 jugadores",
				"El partido de la fecha " + partido.fechaInicio + " ya NO tiene 10 jugadores");
		}
	}

}
