package com.dds.grupo4.observadores

import com.dds.grupo4.observadores.InscripcionObserver
import com.dds.grupo4.dominio.Inscripcion
import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.mail.MailSender

class InscripcionAmigo extends InscripcionObserver {

	new(Partido partido, MailSender mailSender) {
		super(partido, mailSender)
	}

	override notificarNuevaInscripcion(Inscripcion inscripcion) {
		inscripcion.jugador.mailsAmigos.forEach(
			mail|
				enviarMail(
					inscripcion.jugador.mail, //"sistema@ddsutn.com",
					mail,
					"Tu amigo se anoto al partido",
					"Tu amigo " + inscripcion.jugador.nombre + " se anoto al partido de la fecha "
				));
	}
	
	override notificarBajaInscripcion() {
		// No hago nada
	}

}
