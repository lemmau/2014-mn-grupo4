package com.dds.grupo4

import java.util.Map
import java.util.HashMap
import java.util.ArrayList
import java.util.List
//import com.dds.grupo4.home.InteresadosRechazados
//import com.dds.grupo4.home.TodosLosJugadores
import com.dds.grupo4.excepciones.BusinessException

class Admin {
	
	// TODO es necesario tener la edad del admin?
	@Property private Integer edad;
	@Property private String nombre;
	@Property private String apellido;
	@Property private String mail;
	
	// TODO esta deberia ser responsabilidad de TodosLosJugadores.xtend
	@Property private List<Interesado> nuevosInteresadosPosibles = new ArrayList<Interesado>;
	
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

	def proponerInteresado(Interesado interesado) {
		nuevosInteresadosPosibles.add(interesado);
	}

	def realizarOperacionPropuesta(Interesado interesado, (Interesado)=>void operacion) {
		if (!this.nuevosInteresadosPosibles.contains(interesado)) {
			throw new BusinessException("El interesado no ha sido propuesto al admin")
		} else {
			this.nuevosInteresadosPosibles.remove(interesado)
			operacion.apply(interesado)
		}
	}

	// Muevo estos metodos a TodosLosJugadores
//	def aprobarInteresado(Interesado interesado) {
//		this.realizarOperacionPropuesta(interesado, [TodosLosJugadores.agregarJugadorAlSistema(interesado)])
//	}
//
//	def desaprobarInteresado(Interesado interesado) {
//		this.realizarOperacionPropuesta(interesado, [InteresadosRechazados.agregarInteresado(interesado)])
//	}

}
