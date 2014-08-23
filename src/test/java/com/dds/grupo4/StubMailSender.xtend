package com.dds.grupo4

import java.util.HashMap
import java.util.Set
import java.util.HashSet
import java.util.Map
import com.dds.grupo4.mail.MessageSender
import com.dds.grupo4.mail.Mail

class StubMailSender implements MessageSender {

	Map<String, Set<String>> mailsEnviados

	override send(Mail mail) {
		simularEnvioMail(mail.from, mail.message)
		var StringBuffer buf = new StringBuffer
		
		buf.append("Simulación envío de mail | From: ").append(mail.from).append(" | To: ").append(mail.to).append(
			" | Message: ").append(mail.message)
			
		println(buf.toString)
	}

	def simularEnvioMail(String from, String message) {
		var mensajes = mailsDe(from)
		mensajes.add(message)
		mailsEnviados.put(from, mensajes)
	}

	def Set<String> mailsDe(String from) {
		var Set<String> mensajes = mailsEnviados.get(from)
		if (mensajes == null) {
			mensajes = new HashSet<String>
		}
		mensajes
	}

	/**********************************************
	 * IMPLEMENTACION DE SINGLETON
	 * ********************************************/
	static StubMailSender instance

	// redefinimos el new como privado
	private new() {
		mailsEnviados = new HashMap<String, Set<String>>
	}

	def static getInstance() {
		if (instance == null) {
			instance = new StubMailSender()
		}
		instance
	}

}
