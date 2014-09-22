package com.dds.grupo4.observadores

import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.mail.MailSender
import com.dds.grupo4.dominio.Inscripcion
import com.dds.grupo4.mail.MailAdapter

abstract class InscripcionObserver {
	protected Partido partido;
	protected MailSender mailSender;

	new(Partido partido, MailSender mailSender) {
		this.partido = partido;
		this.mailSender = mailSender;
	}

	def void notificarNuevaInscripcion(Inscripcion inscripcion);

	def void notificarBajaInscripcion();

	def void enviarMail(String remitente, String receptor, String asunto, String mensaje) {
		mailSender.sendMail(MailAdapter.crearMail(remitente, receptor, asunto, mensaje));
	}
}
