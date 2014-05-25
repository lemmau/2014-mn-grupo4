package com.dds.grupo4

import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion
import java.util.List
import java.util.Random
import java.util.ArrayList
import java.util.HashMap
import java.util.Map
import com.dds.grupo4.mail.Mail

class Interesado implements MessageSender{

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
	@Property private List<Calificacion> calificacionesHechas = new ArrayList<Calificacion>
	@Property private MessageSender messageSender
	
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
				
		this.amigos.forEach[amigo| this.mandarMail(amigo)]
	}
	
	def mandarMail(Interesado interesado) {
			
		var mailAEnviar = new Mail
		
		mailAEnviar.from = this.mail
		mailAEnviar.to = interesado.mail
		mailAEnviar.titulo = "Me inscribi a un partido!"
		mailAEnviar.message = ""
			
		send(mailAEnviar)
		
	}

//	def void recibirMail(String mail) {
//		try {
//			this.mailsRecibidos.put(mail, this.mailsRecibidos.get(mail) + 1)
//		} catch (Exception ex) {
//			this.mailsRecibidos.put(mail, 1)
//		}
//
//	}

	def agregarInfraccion(Infraccion infraccion) {
		this.infracciones.add(infraccion)
	}

	def estasConfirmado(Partido partido) {

		this.tipoDeInscripcion.estasConfirmado(partido)
	}

	def Integer getPrioridad() {
		this.tipoDeInscripcion.getPrioridad;
	}


	def calificar(Interesado jugador, Partido partido){
		
		var Calificacion calificacion
		var String critica
		var int nota
		
		calificacion = new Calificacion(partido, jugador, nota, critica)
		
		calificacionesHechas.add(calificacion)
		
	}

	//For testing purpose
	def Integer quantityMailsFromPerson(Interesado person) {
		return this.mailsRecibidos.get(person.getMail)
	}
	
	override send(Mail mail) {
		
		this.messageSender.send(mail)
	
	}
	
	
//	def calificarAlResto(List<Interesado> jugadores, Partido partido) {
//		
//		jugadores.remove(this)
//		jugadores.forEach[ jugador | this.calificar(jugador, partido)]
//			
//	}
//
//	def proponerJugador(Partido partido){
//		val int cantidadAmigos = this.amigos.size
//		var	Interesado amigo
//		val random = new Random();
//		
//		amigo = this.amigos.get(random.nextInt(cantidadAmigos))
//		
//		partido.tratarPropuesta(amigo)
//		
//		
//	}

}
