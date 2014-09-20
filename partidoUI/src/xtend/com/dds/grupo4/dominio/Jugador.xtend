package com.dds.grupo4.dominio

import com.dds.grupo4.excepciones.HandicapFueraDeRangoException
import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion

import java.util.ArrayList
import java.util.List
import org.joda.time.LocalDate

class Jugador {

	@Property private Long id
	@Property private String nombre
	@Property private String apellido
	@Property private String apodo
	@Property private LocalDate fechaNacimiento
	@Property private Integer handicap
	@Property private String mail
	@Property private TipoDeInscripcion tipoDeInscripcion

	@Property private List<Jugador> amigos = new ArrayList<Jugador>
	@Property private List<Infraccion> infracciones = new ArrayList<Infraccion>

	new(){

	}

	new(String nombre, String apellido, String apodo, LocalDate nacimiento, TipoDeInscripcion tipoDeInscripcion) {
		this(nombre, apellido, apodo,  nacimiento, tipoDeInscripcion, 1)
	}

	new(String nombre, String apellido, String apodo, LocalDate nacimiento, TipoDeInscripcion tipoDeInscripcion, Integer handicap) {
		this.nombre = nombre
		this.apellido = apellido
		this.apodo = apodo
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
		LocalDate.now.getYear - fechaNacimiento.getYear
		//LocalDate.now.year - fechaNacimiento.year
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

	def Integer getPrioridad() {
		this.tipoDeInscripcion.getPrioridad;
	}

	// TODO La infraccion debe estar relacionada al partido?
	def agregarInfraccion(String motivo) {
		this.infracciones.add(new Infraccion(motivo, LocalDate.now()))
	}

	def Integer cantidadInfracciones() {
		this.infracciones.size
	}


	// Defino como que dos jugadores son el mismo cuando tienen mismo nombre, apellido y fecha de nacimiento
	def equals(Jugador i) {
		return (
				this.nombre.equalsIgnoreCase(i.nombre) &&
				this.apellido.equalsIgnoreCase(i.apellido) &&
				this.fechaNacimiento.equals(i.fechaNacimiento)
				)
	}
	
}
