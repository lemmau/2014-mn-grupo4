package com.dds.grupo4.mail

class Mail {

	@Property String from
	@Property String to
	@Property String subject
	@Property String message

	new(String remitente, String receptor, String asunto, String mensaje) {
		from = remitente
		to = receptor
		subject = asunto
		message = mensaje
	}
}
