package com.dds.grupo4

import com.dds.grupo4.excepciones.BusinessException
import com.dds.grupo4.excepciones.NoEsJugadorDelPartidoException
import com.dds.grupo4.ordenamiento.CriterioOrden
import java.time.LocalDateTime
import java.util.ArrayList
import java.util.List

class Partido {

	val private static MIN_CANTIDAD_JUGADORES = Integer.valueOf(0)
	val private static MAX_CANTIDAD_JUGADORES = Integer.valueOf(10)

	@Property LocalDateTime fechaInicio;

	//@Property List<Interesado> interesados = new ArrayList;
	@Property List<Inscripcion> inscripciones = new ArrayList;
	@Property private Admin admin
	@Property private String mail
	@Property List<Interesado> jugadoresDelPartido = new ArrayList
	@Property List<Inscripcion> equipoA = new ArrayList;
	@Property List<Inscripcion> equipoB = new ArrayList;
	@Property List<CriterioOrden> criteriosOrden = new ArrayList;

	new(Admin admin) {
		this.admin = admin
	}

	def void inscribirA(Interesado nuevoInteresado) {

		val Integer posicion = this.inscripciones.indexOf(
			this.inscripciones.findFirst[inscripcion|inscripcion.jugador.getPrioridad > nuevoInteresado.getPrioridad])

		if (-1 == posicion)
			this.inscripciones.add(new Inscripcion(nuevoInteresado))
		else
			this.inscripciones.add(posicion, new Inscripcion(nuevoInteresado))

	}

	def List<Inscripcion> jugadoresFinales() {
		try {
			return this.inscripciones.filter[inscripcion|inscripcion.jugador.estasConfirmado(this)].toList.
				subList(MIN_CANTIDAD_JUGADORES, MAX_CANTIDAD_JUGADORES)
		} catch (IndexOutOfBoundsException ex) {
			throw new BusinessException("No hay diez jugadores para realizar un partido")
		}
	}

	def cantidadInteresados() {
		this.inscripciones.size
	}

	def Boolean esUnInteresado(Interesado interesado) {
		return this.inscripciones.filter[inscripcion|inscripcion.jugador.equals(interesado)].size != 0
	}

	def Boolean esUnJugadorFinal(Interesado interesado) {
		return jugadoresFinales.filter[inscripcion|inscripcion.jugador.equals(interesado)].size != 0
	}

	def Inscripcion obtenerInscripcion(Interesado interesado) {
		this.inscripciones.findFirst[inscripcion|inscripcion.jugador.equals(interesado)]
	}


	def Inscripcion quitarJugador(Interesado interesado) {
		val Inscripcion inscripcion = this.inscripciones.findFirst[inscripcion|inscripcion.jugador.equals(interesado)]

		if (null == inscripcion)
			throw new NoEsJugadorDelPartidoException("El jugador no existe entre los inscriptos al partido")

		this.inscripciones.remove(inscripcion)
		return inscripcion
	}

	def void darDeBajaA(Interesado interesado) {
		quitarJugador(interesado)
		interesado.agregarInfraccion("NO tiene reemplazante")
	}

	def void darDeBajaA(Interesado resagado, Interesado reemplazante) {
		quitarJugador(resagado)
		this.inscribirA(reemplazante)
	}

	def Inscripcion obtenerJugadorFinal(Interesado jugador) {
		val Inscripcion jugadorFinal = this.jugadoresFinales.findFirst[i|i.jugador.equals(jugador)]
		
		if (null == jugadorFinal)
			throw new NoEsJugadorDelPartidoException("Solo se puede calificar a jugadores del partido");

		jugadorFinal
	}

	def void calificarA(Interesado jugador, Integer puntaje, String critica) {
		val Inscripcion jugadorAcalificar = obtenerJugadorFinal(jugador) 

		jugadorAcalificar.calificar(puntaje, critica)
	}

	def Integer cantidadCalificaciones(Interesado jugador) {
		val Inscripcion jugadorFinal = obtenerJugadorFinal(jugador)
		jugadorFinal.cantidadCalificaciones 
	}

	def Integer promedioCalificaciones(Interesado jugador) {
		val Inscripcion jugadorFinal = obtenerJugadorFinal(jugador)
		jugadorFinal.promedioCalificaciones
	}

	def Integer promedioNCalificaciones(Interesado jugador, Integer ultimasN) {
		val Inscripcion jugadorFinal = obtenerJugadorFinal(jugador)
		jugadorFinal.promedioUltimasCalificaciones(ultimasN)
	}

	def agregarCriterioOrdenamiento(CriterioOrden criterio) {
		this.criteriosOrden.add(criterio)
	}

	// TODO delegar esta responsabilidad a criteriosOrden
	// no usar "Lista" en nombre del metodo	
	def ordenarListaJugadores() {
		//this.inscripciones.forEach[inscripcion | this.criteriosOrden.forEach[ c | c.obtenerValor(inscripcion)] ]
		// TODO No hace falta guardar la lista ordenada. 
		val List<Inscripcion> aux = this.inscripciones.sortBy[inscripcion | this.criteriosOrden.map[ c | c.obtenerValor(inscripcion)].reduce[p1, p2| p1 + p2] ]
		this.inscripciones = aux
	}

	def generarEquiposTentativos() {
		// TODO en este metodo llamar a ordenamiento
		// y a dividir equipos
	}

}
