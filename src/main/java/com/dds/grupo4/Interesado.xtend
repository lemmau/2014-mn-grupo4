package com.dds.grupo4

import com.dds.grupo4.mail.Mail
import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion
import java.time.LocalDate
import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map
import java.time.LocalDateTime

class Interesado implements MessageSender {

	@Property private LocalDate fechaNacimiento
	@Property private String nombre;
	@Property private String apellido;
	@Property private String mail;
	@Property private Integer handicap;
	
	@Property private List<Interesado> amigos = new ArrayList<Interesado>
	@Property private TipoDeInscripcion tipoDeInscripcion

	@Property private List<Infraccion> infracciones = new ArrayList<Infraccion>
	//@Property private List<Calificacion> calificaciones = new ArrayList<Calificacion>

	// TODO Delegaria esta responsabilidad al objeto MessageSender
	@Property private Map<String, Integer> mailsRecibidos = new HashMap<String, Integer>	
	@Property private MessageSender messageSender



	new(String nombre, String apellido, LocalDate nacimiento, TipoDeInscripcion tipoDeInscripcion) {
		this.nombre = nombre
		this.apellido = apellido
		this.fechaNacimiento = nacimiento
		this.tipoDeInscripcion = tipoDeInscripcion
	}

	def Integer edad(){
		// TODO corregir esto! calcular bien la edad
		LocalDate.now.year - fechaNacimiento.year
	}

	def void inscribite(Partido partido) {
		partido.inscribirA(this)
		this.notificarAMisAmigos
		//this.partidosALosQueMeInscribi.add(partido)
	}

	def void cambiarTipoDeInscripcion(TipoDeInscripcion inscripcion) {
		this.tipoDeInscripcion = inscripcion;
	}

	def void agregarAmigo(Interesado interesado) {
		this.amigos.add(interesado)
	}


	def void notificarAMisAmigos() {
		this.amigos.forEach[amigo|this.mandarMail(amigo)]
	}

	def mandarMail(Interesado interesado) {
		var mailAEnviar = new Mail

		mailAEnviar.from = this.mail
		mailAEnviar.to = interesado.mail
		mailAEnviar.titulo = "Me inscribi a un partido!"
		mailAEnviar.message = ""

		send(mailAEnviar)
	}

	override send(Mail mail) {
		this.messageSender.send(mail)
	}


	// TODO Pasamanos
	def estasConfirmado(Partido partido) {
		this.tipoDeInscripcion.estasConfirmado(partido)
	}

	def Integer getPrioridad() {
		this.tipoDeInscripcion.getPrioridad;
	}

	// TODO La infraccion debe estar relacionada al partido?
	def agregarInfraccion(String motivo) {
		this.infracciones.add(new Infraccion(motivo, LocalDateTime.now()))
	}

	def Integer cantidadInfracciones() {
		this.infracciones.size
	}

//	def Integer cantidadCalificaciones() {
//		this.calificaciones.size
//	}
//
//	def calificarJugador(Calificacion calificacion) {
//		if (cantidadCalificaciones >= 9)
//			throw new SuperaMaximoCalificacionesException("El jugador ya tiene el maximo de calificaciones por partido")
//
//		calificaciones.add(calificacion)
//		
//	}

//	def calificarAlResto(List<Interesado> jugadores, Partido partido) {
//		jugadores.remove(this)
//		jugadores.forEach[jugador|this.calificar(jugador, partido)]
//	}

	// TODO La critica deberia poder ingresarse por pantalla en algun momento 
	// y recibirla en algun parametro.
//	def calificar(Interesado jugador, Partido partido) {
//		var Calificacion calificacion
//		var String critica
//		var int nota
//
//		//calificacion = new Calificacion(partido, jugador, nota, critica)
//		calificacion = new Calificacion(partido, nota, critica)
//		calificacionesHechas.add(calificacion)
//	}




	// Defino como que dos jugadores son el mismo cuando tienen mismo nombre, apellido y fecha de nacimiento
	def equals(Interesado i) {
		return (
				this.nombre.equalsIgnoreCase(i.nombre) &&
				this.apellido.equalsIgnoreCase(i.apellido) &&
				this.fechaNacimiento.equals(i.fechaNacimiento)
				)
	}

}
