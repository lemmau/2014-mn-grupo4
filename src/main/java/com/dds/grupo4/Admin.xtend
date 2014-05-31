package com.dds.grupo4

import java.util.Map
import java.util.HashMap
import java.util.ArrayList
import java.util.List
import com.dds.grupo4.home.InteresadosRechazados
import com.dds.grupo4.home.TodosLosJugadores

class Admin {
	@Property private Integer edad;
	@Property private String nombre;
	@Property private String apellido;
	@Property private String mail;
	@Property private List<Interesado> nuevosInteresadosPosibles = new ArrayList<Interesado>;
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

	def proponerInteresado(Interesado interesado) {
		nuevosInteresadosPosibles.add(interesado);
	}

	def validarPropuesta(Interesado interesado) {
	}

	def aprobarInteresado(Interesado interesado) {
		TodosLosJugadores.agregarJugadorAlSistema(interesado)
	}

	def desaprobarInteresado(Interesado interesado) {
		InteresadosRechazados.agregarInteresado(interesado);
	}

}
