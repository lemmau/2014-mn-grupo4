package com.dds.grupo4

import java.util.Map
import java.util.HashMap

class Admin {
	@Property private Integer edad;
	@Property private String nombre;
	@Property private String apellido;
	@Property private String mail;
	@Property private Map<String,Integer> mailsRecibidos = new HashMap<String,Integer>
	
	def void recibirMail(String mail) {
		try {
			this.mailsRecibidos.put(mail, this.mailsRecibidos.get(mail) + 1)
		} catch (Exception ex) {
			this.mailsRecibidos.put(mail, 1)
		}

	}
}