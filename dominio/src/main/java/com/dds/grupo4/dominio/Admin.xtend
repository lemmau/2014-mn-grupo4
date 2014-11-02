package com.dds.grupo4.dominio

import java.util.HashMap
import java.util.Map

import com.dds.grupo4.excepciones.BusinessException

class Admin {
	
	@Property private String nombre;
	@Property private String apellido;
	@Property private String mail;

	
	// TODO delegaria esta responsabilidad al MessageSender
	@Property private Map<String, Integer> mailsRecibidos = new HashMap<String, Integer>

	new(String mail) {
		this.mail = mail
	}
	
	new(String mail,String nombre,String apellido){
		this.mail = mail
		this.apellido = apellido
		this.nombre = nombre
	}

	def void recibirMail(String mail) {
		try {
			this.mailsRecibidos.put(mail, this.mailsRecibidos.get(mail) + 1)
		} catch (BusinessException ex) {
			this.mailsRecibidos.put(mail, 1)
		}

	}

}
