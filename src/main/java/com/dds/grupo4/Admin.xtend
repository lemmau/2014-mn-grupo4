package com.dds.grupo4

import java.util.HashMap
import java.util.Map

import com.dds.grupo4.excepciones.BusinessException

class Admin {
	
	// TODO es necesario tener la edad del admin?
	@Property private Integer edad;
	@Property private String nombre;
	@Property private String apellido;
	@Property private String mail;

	
	// TODO delegaria esta responsabilidad al MessageSender
	@Property private Map<String, Integer> mailsRecibidos = new HashMap<String, Integer>

	new(String mail) {
		this.mail = mail
	}

	def void recibirMail(String mail) {
		try {
			this.mailsRecibidos.put(mail, this.mailsRecibidos.get(mail) + 1)
		} catch (BusinessException ex) {
			this.mailsRecibidos.put(mail, 1)
		}

	}

}
