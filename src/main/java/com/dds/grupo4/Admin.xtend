package com.dds.grupo4

import java.util.Map
import java.util.HashMap

class Admin {
	@Property private Integer edad;
	@Property private String nombre;
	@Property private String apellido;
	@Property private String mail;
	@Property private Map<String, Integer> mailsRecibidos = new HashMap<String, Integer>

	new(String mail) {
		this.mail = mail
	}

	def void recibirMail(String mail) {
		try {
			this.mailsRecibidos.put(mail, this.mailsRecibidos.get(mail) + 1)
		} catch (Exception ex) {
			this.mailsRecibidos.put(mail, 1)
		}

	}

	def aprobarInteresado(Interesado interesado) {
	}

	def desproborInteresado(Interesado interesado) {
	}

	def validarPropuesta(Interesado interesado, Partido partido) {

		if (this.unCriterio(interesado)) {
			TodosLosJugadores.agregarJugadorAlSistema(interesado)
			partido.inscribirA(interesado)
		} else {
			this.registrarRechazo(interesado, partido)
		}
		
	}

	def registrarRechazo(Interesado interesado, Partido partido) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	def unCriterio(Interesado interesado) {
		Boolean.TRUE
	}

}
