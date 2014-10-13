package com.dds.grupo4.mail

class MailAdapter {

	def static Mail crearMail(String remitente, String receptor, String asunto, String mensaje  ){
		return new Mail(remitente, receptor, asunto, mensaje);
	}
}