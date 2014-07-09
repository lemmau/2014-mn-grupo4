package com.dds.grupo4

import com.dds.grupo4.mail.Mail
import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion
import java.time.LocalDate
import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map
import java.time.LocalDateTime
import com.dds.grupo4.excepciones.HandicapFueraDeRangoException

class Interesado implements MessageSender {

	@Property private String nombre;
	@Property private String apellido;
	@Property private LocalDate fechaNacimiento
	@Property private String mail;
	@Property private Integer handicap;
	
	@Property private List<Interesado> amigos = new ArrayList<Interesado>
	@Property private TipoDeInscripcion tipoDeInscripcion

	@Property private List<Infraccion> infracciones = new ArrayList<Infraccion>

	// TODO Delegaria esta responsabilidad al objeto MessageSender
	@Property private Map<String, Integer> mailsRecibidos = new HashMap<String, Integer>	
	@Property private MessageSender messageSender


	new(String nombre, String apellido, LocalDate nacimiento, TipoDeInscripcion tipoDeInscripcion) {
		this(nombre, apellido, nacimiento, tipoDeInscripcion, 1)
	}

	new(String nombre, String apellido, LocalDate nacimiento, TipoDeInscripcion tipoDeInscripcion, Integer handicap) {
		this.nombre = nombre
		this.apellido = apellido
		this.fechaNacimiento = nacimiento
		this.tipoDeInscripcion = tipoDeInscripcion
		setHandicap(handicap)
	}

	def void setHandicap(Integer h) {
		if (!(0 < h && 10 >= h ))
			throw new HandicapFueraDeRangoException("Solo se acepta handicap entre 1 y 10")

		_handicap = h
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



	// Defino como que dos jugadores son el mismo cuando tienen mismo nombre, apellido y fecha de nacimiento
	def equals(Interesado i) {
		return (
				this.nombre.equalsIgnoreCase(i.nombre) &&
				this.apellido.equalsIgnoreCase(i.apellido) &&
				this.fechaNacimiento.equals(i.fechaNacimiento)
				)
	}

}
