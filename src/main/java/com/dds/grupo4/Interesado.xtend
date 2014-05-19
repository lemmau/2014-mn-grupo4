package com.dds.grupo4

import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion
import java.util.List
import java.util.Random
import java.util.ArrayList
import java.util.HashMap
import java.util.Map

class Interesado {

	@Property private Integer edad;
	@Property private String nombre;
	@Property private String apellido;
	@Property private String mail;
	@Property private String password
	@Property private List<Interesado> amigos = new ArrayList<Interesado>;
	@Property private TipoDeInscripcion tipoDeInscripcion;
	@Property private List<Infraccion> infracciones = new ArrayList<Infraccion>
	@Property private List<Partido> partidosALosQueMeInscribi = new ArrayList<Partido>
	@Property private Map<String, Integer> mailsRecibidos = new HashMap<String, Integer>

	new(String nombre, String apellido, Integer edad, TipoDeInscripcion tipoDeInscripcion) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.edad = edad;
		this.tipoDeInscripcion = tipoDeInscripcion;
	}

	def void inscribite(Partido partido) {
		partido.inscribirA(this)
		this.notificarAMisAmigos
		this.partidosALosQueMeInscribi.add(partido)
	}

	def void cambiarTipoDeInscripcion(TipoDeInscripcion inscripcion) {
		this.tipoDeInscripcion = inscripcion;
	}

	def void agregarAmigo(Interesado interesado) {
		this.amigos.add(interesado)
	}

	def Interesado getReemplazante() {
		val int cantidadAmigos = this.amigos.size
		var Interesado reemplazante;

		if (cantidadAmigos > 0) {
			val random = new Random();
			reemplazante = this.amigos.get(random.nextInt(cantidadAmigos))
		} else {
			throw new RuntimeException("No tiene amigos de reemplazo")
		}

		return reemplazante
	}

	def void notificarAMisAmigos() {
		this.amigos.forEach[amigo|amigo.recibirMail(this.mail)]
	}

	def void recibirMail(String mail) {
		try {
			this.mailsRecibidos.put(mail, this.mailsRecibidos.get(mail) + 1)
		} catch (Exception ex) {
			this.mailsRecibidos.put(mail, 1)
		}

	}

	def agregarInfraccion(Infraccion infraccion) {
		this.infracciones.add(infraccion)
	}

	def estasConfirmado(Partido partido) {

		this.tipoDeInscripcion.estasConfirmado(partido)
	}

	def Integer getPrioridad() {
		this.tipoDeInscripcion.getPrioridad;
	}

	//For testing purpose
	def Integer quantityMailsFromPerson(Interesado person) {
		return this.mailsRecibidos.get(person.getMail)
	}

}
