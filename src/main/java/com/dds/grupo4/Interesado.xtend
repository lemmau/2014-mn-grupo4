package com.dds.grupo4

import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion
import java.util.List
import java.util.Random
import java.util.ArrayList
import java.util.HashMap
import java.util.Map
import com.dds.grupo4.mail.Mail
import com.dds.grupo4.excepciones.BusinessException
import java.time.LocalDate

class Interesado implements MessageSender {

	// Este campo es calculado y debe actualizarse cada año a todos los jugadores, es muy costoso.
	// Lo reemplazaria por fecha de nacimiento y si fuera necesario obtener la edad
	// creamos un metodo que calcule la edad en base a la fecha del dia. 
	@Property private Integer edad;
	@Property private LocalDate fechaNacimiento
	@Property private String nombre;
	@Property private String apellido;
	@Property private String mail;
	@Property private String password // TODO Es necesario password aca?
	@Property private List<Interesado> amigos = new ArrayList<Interesado>
	@Property private TipoDeInscripcion tipoDeInscripcion
	@Property private List<Infraccion> infracciones = new ArrayList<Infraccion>
	
	// TODO Aca hay un nivel de acoplamiento importante ademas de que es redundante 
	// porque todos los partidos conocen a sus jugadores
	// y todos los jugadores conoces a los partidos en que jugaron. 
	@Property private List<Partido> partidosALosQueMeInscribi = new ArrayList<Partido>

	// TODO Delegaria esta responsabilidad al objeto MessageSender
	@Property private Map<String, Integer> mailsRecibidos = new HashMap<String, Integer>
	
	// TODO No me interesan mas las calificaciones recibidas?
	@Property private List<Calificacion> calificacionesHechas = new ArrayList<Calificacion>
	@Property private List<Calificacion> calificaciones = new ArrayList<Calificacion>
	
	@Property private MessageSender messageSender

	new(String nombre, String apellido, Integer edad, TipoDeInscripcion tipoDeInscripcion) {
		this(nombre, apellido, LocalDate.now, tipoDeInscripcion)
		this.edad = edad
	}

	new(String nombre, String apellido, LocalDate nacimiento, TipoDeInscripcion tipoDeInscripcion) {
		this.nombre = nombre
		this.apellido = apellido
		this.fechaNacimiento = nacimiento
		this.tipoDeInscripcion = tipoDeInscripcion
	}

	override send(Mail mail) {
		this.messageSender.send(mail)
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

	// TODO Debe ser autamtico la eleccion del reemplazo?
	// No lo debe proponer el propio jugador?
	// El jugador de reemplazo debe ser si o si un amigo registrado del jugador que se da de baja?
	def Interesado getReemplazante() {
		val int cantidadAmigos = this.amigos.size
		var Interesado reemplazante;

		if (cantidadAmigos > 0) {
			val random = new Random();
			reemplazante = this.amigos.get(random.nextInt(cantidadAmigos))
		} else {
			throw new BusinessException("No tiene amigos de reemplazo")
		}

		return reemplazante
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

	// TODO La infraccion debe estar relacionada al partido?
	def agregarInfraccion(Infraccion infraccion) {
		this.infracciones.add(infraccion)
	}

	// TODO Pasamanos
	def estasConfirmado(Partido partido) {
		this.tipoDeInscripcion.estasConfirmado(partido)
	}

	def Integer getPrioridad() {
		this.tipoDeInscripcion.getPrioridad;
	}

	def Integer cantidadCalificaciones() {
		this.calificaciones.size
	}

	// TODO La critica deberia poder ingresarse por pantalla en algun momento 
	// y recibirla en algun parametro.
	def calificar(Interesado jugador, Partido partido) {
		var Calificacion calificacion
		var String critica
		var int nota

		//calificacion = new Calificacion(partido, jugador, nota, critica)
		calificacion = new Calificacion(partido, nota, critica)
		calificacionesHechas.add(calificacion)
	}

	def calificarJugador(Calificacion calificacion) {
		if (cantidadCalificaciones >= 9)
			throw new BusinessException("El jugador ya tiene el maximo de calificaciones por partido")

		calificaciones.add(calificacion)
		
	}

	def calificarAlResto(List<Interesado> jugadores, Partido partido) {
		jugadores.remove(this)
		jugadores.forEach[jugador|this.calificar(jugador, partido)]
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
