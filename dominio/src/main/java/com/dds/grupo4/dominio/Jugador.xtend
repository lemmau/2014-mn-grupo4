package com.dds.grupo4.dominio

import com.dds.grupo4.excepciones.HandicapFueraDeRangoException
import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion

import java.util.ArrayList
import java.util.List
import org.joda.time.LocalDate
import org.joda.time.LocalDateTime
import org.joda.time.DateTime
import java.text.SimpleDateFormat
import com.dds.grupo4.home.TodosLosJugadores
import org.apache.commons.lang.builder.EqualsBuilder
import com.dds.grupo4.IdGenerator

class Jugador {

	@Property private List<Partido> partidosJugados = new ArrayList
	@Property private Long id
	@Property private String nombre
	@Property private String apellido
	@Property private String apodo
	@Property private DateTime fechaNacimiento
	private String fechaFormateada
	@Property private Integer handicap = 1
	@Property private String mail

	@Property List<Jugador> amigos = new ArrayList<Jugador>
	@Property private TipoDeInscripcion tipoDeInscripcion

	@Property private List<Infraccion> infracciones = new ArrayList<Infraccion>

	new() {
	}

	new(String nombre, String apellido, String apodo, DateTime nacimiento, TipoDeInscripcion tipoDeInscripcion) {
		this(nombre, apellido, apodo, nacimiento, tipoDeInscripcion, 1)
	}

	new(String nombre, String apellido, String apodo, DateTime nacimiento, TipoDeInscripcion tipoDeInscripcion,
		Integer handicap) {
		this.id = IdGenerator.generateUUID
		this.nombre = nombre
		this.apodo = apodo
		this.apellido = apellido
		this.fechaNacimiento = nacimiento
		this.tipoDeInscripcion = tipoDeInscripcion
		setHandicap(handicap)
	}

	def agregarPartidoJugado(Partido partido) {
		partidosJugados.add(partido)
	}

	def Double promedioUltimoPartido() {
		val Partido ultimoPartido = partidosJugados.last
		var Double promedio = new Double(0)

		if (ultimoPartido != null) {
			promedio = ultimoPartido.obtenerInscripcion(this).promedioCalificaciones
		}

		promedio
	}

	def void setHandicap(Integer h) {
		if (!(0 < h && 10 >= h ))
			throw new HandicapFueraDeRangoException("Solo se acepta handicap entre 1 y 10")

		_handicap = h
	}

	def Integer edad() {

		// TODO corregir esto! calcular bien la edad
		DateTime.now.getYear() - fechaNacimiento.getYear()
	}

	def void inscribite(Partido partido) {
		partido.inscribirA(this)

	//this.partidosALosQueMeInscribi.add(partido)
	}

	def void cambiarTipoDeInscripcion(TipoDeInscripcion inscripcion) {
		this.tipoDeInscripcion = inscripcion;
	}

	def void agregarAmigo(Jugador interesado) {
		this.amigos.add(interesado)
	}

	def List<String> mailsAmigos() {
		this.amigos.map(amigo|amigo.mail);
	}

	// TODO Pasamanos
	def estasConfirmado(Partido partido) {
		this.tipoDeInscripcion.estasConfirmado(partido)
	}

	//	override def boolean equals(Object obj) {
	//		return EqualsBuilder.reflectionEquals(this, obj);
	//	}
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
	def equals(Jugador i) {
		return (
					this.nombre.equalsIgnoreCase(i.nombre) && this.apellido.equalsIgnoreCase(i.apellido) &&
			this.fechaNacimiento.equals(i.fechaNacimiento)
					)
	}

	def String getFechaFormateada() {
		val SimpleDateFormat dateParser = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		dateParser.format(fechaNacimiento.toDate())
	}

	def Boolean tieneInfracciones() {
		return infracciones.size > 0
	}

}
