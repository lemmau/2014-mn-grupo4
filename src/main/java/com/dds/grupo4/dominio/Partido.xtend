package com.dds.grupo4.dominio

import java.time.LocalDateTime
import java.util.ArrayList
import java.util.List
import com.dds.grupo4.excepciones.FaltaDefinirCriterioDeOrdenException
import com.dds.grupo4.excepciones.InscripcionCerradaException
import com.dds.grupo4.excepciones.BusinessException
import com.dds.grupo4.excepciones.NoEsJugadorDelPartidoException
import com.dds.grupo4.ordenamiento.CriterioOrden
import com.dds.grupo4.divisorequipos.DivisorDeEquipos
import com.dds.grupo4.observadores.InscripcionObserver

class Partido {

	val private static MIN_CANTIDAD_JUGADORES = Integer.valueOf(0)
	val private static MAX_CANTIDAD_JUGADORES = Integer.valueOf(10)
	private static boolean INSCRIPCION_CERRADA = false;

	@Property LocalDateTime fechaInicio;
	@Property List<Inscripcion> inscripciones = new ArrayList
	@Property private Admin admin
	//@Property private String mail
	@Property List<Jugador> jugadoresDelPartido = new ArrayList
	@Property List<Inscripcion> equipoA = new ArrayList
	@Property List<Inscripcion> equipoB = new ArrayList
	@Property List<CriterioOrden> criteriosOrden = new ArrayList
	@Property List<InscripcionObserver> observadores = new ArrayList

	new(Admin admin) {
		this.admin = admin
	}

	def void inscribirA(Jugador nuevoInteresado) {

		if(INSCRIPCION_CERRADA)
			throw new InscripcionCerradaException("La inscripcion a este partido esta cerrada")

		val Inscripcion nuevaInscripcion = new Inscripcion(nuevoInteresado)

		this.inscripciones.add(nuevaInscripcion)

		this.inscripciones = this.inscripciones.sortBy[inscripcion|inscripcion.jugador.getPrioridad]

		notificarInscripcion(nuevaInscripcion)
	}

	def notificarInscripcion(Inscripcion inscripcion) {
		observadores.forEach[obs|obs.notificarNuevaInscripcion(inscripcion)]
	}

	def notificarBajaInscripcion() {
		observadores.forEach[obs|obs.notificarBajaInscripcion()]
	}

	def void inscribirTodos(List<Jugador> nuevosInteresados) {
		nuevosInteresados.forEach[interesado|inscribirA(interesado)]
	}

	def List<Inscripcion> jugadoresFinales() {
		try {
			return this.inscripciones.filter[inscripcion|inscripcion.jugador.estasConfirmado(this)].toList.
				subList(MIN_CANTIDAD_JUGADORES, MAX_CANTIDAD_JUGADORES)
		} catch (IndexOutOfBoundsException ex) {
			throw new BusinessException("No hay diez jugadores para realizar un partido")
		}
	}

	def cerrarInscripcion(){
		INSCRIPCION_CERRADA = true;
	}

	def cantidadInteresados() {
		this.inscripciones.size
	}

	def Boolean esUnInteresado(Jugador interesado) {
		return this.inscripciones.filter[inscripcion|inscripcion.jugador.equals(interesado)].size != 0
	}

	def Boolean esUnJugadorFinal(Jugador interesado) {
		return jugadoresFinales.filter[inscripcion|inscripcion.jugador.equals(interesado)].size != 0
	}

	def Inscripcion obtenerInscripcion(Jugador jugador) {
		obtenerInscripcion(jugador, inscripciones)
	}

	def Inscripcion obtenerInscripcion(Jugador interesado, List<Inscripcion> lista) {
		val encontrado = lista.findFirst[inscripcion|inscripcion.jugador.equals(interesado)]
		if( null == encontrado )
			throw new NoEsJugadorDelPartidoException("El jugador no existe entre los inscriptos al partido")

		return encontrado
	}

	def quitarJugador(Jugador jugador) {
		this.inscripciones.remove(obtenerInscripcion(jugador))
	}

	// TODO Logica repetida en estos 2 metodos
	def void darDeBajaA(Jugador interesado) {
		quitarJugador(interesado)
		interesado.agregarInfraccion("NO tiene reemplazante")
		notificarBajaInscripcion()
	}

	def void darDeBajaA(Jugador resagado, Jugador reemplazante) {
		quitarJugador(resagado)
		this.inscribirA(reemplazante)
		notificarBajaInscripcion()
	}

	def Inscripcion obtenerJugadorFinal(Jugador jugador) {
		obtenerInscripcion(jugador, jugadoresFinales)
	}

	// TODO validar que un jugador no pueda calificar a otro más de una vez por partido
	def void calificarA(Jugador jugador, Integer puntaje, String critica) {
		obtenerJugadorFinal(jugador).calificar(puntaje, critica)
	}

	def Integer cantidadCalificaciones(Jugador jugador) {
		obtenerJugadorFinal(jugador).cantidadCalificaciones
	}

	def Double promedioCalificaciones(Jugador jugador) {
		obtenerJugadorFinal(jugador).promedioCalificaciones
	}

	def Double promedioNCalificaciones(Jugador jugador, Integer ultimasN) {
		obtenerJugadorFinal(jugador)
		.promedioUltimasCalificaciones(ultimasN)
	}

	// ABM Criterios orden
	def agregarCriterioOrdenamiento(CriterioOrden criterio) {
		this.criteriosOrden.add(criterio)
	}

	def quitarCriterioOrdenamiento(CriterioOrden criterio) {
		this.criteriosOrden.remove(criterio)
	}

	def eliminarCriteriosOrdenamiento() {
		this.criteriosOrden.clear
	}

	// ABM observadores
	def agregarObservador(InscripcionObserver observador) {
		observadores.add(observador)
	}

	def quitarObservador(InscripcionObserver observador) {
		observadores.remove(observador)
	}

	def eliminarObservadores() {
		observadores.clear
	}

	// TODO delegar esta responsabilidad a criteriosOrden
	def ordenarJugadoresFinales() {
		if ( criteriosOrden.empty )
			throw new FaltaDefinirCriterioDeOrdenException("Se debe agregar un criterio de orden antes de ordenar")

		//this.criteriosOrden.forEach[criterio|criterio.ordenarJugadoresFinales(this)]

		jugadoresFinales.sortBy[inscripcion|
			this.criteriosOrden.map[c|c.obtenerValor(inscripcion)].reduce[p1, p2|p1 + p2]
			//this.criteriosOrden.fold(0D) [ result, criterio | result + criterio.obtenerValor(inscripcion) ]
			]

	}

	def generarEquiposTentativos(DivisorDeEquipos criterio) {
		// TODO en este metodo llamar a ordenamiento
		// y a dividir equipos
		validarInscripcion();
		criterio.dividirEnEquipos(ordenarJugadoresFinales());
	}
	
	def void validarInscripcion(){
		
		if (!INSCRIPCION_CERRADA || jugadoresFinales.size < 10 )
			throw new InscripcionCerradaException("La inscripcion No esta cerrada")
	}

	def agregarJugadorEquipoA(Inscripcion inscripcion) {
		this.equipoA.add(inscripcion)
	}

	def agregarJugadorEquipoB(Inscripcion inscripcion) {
		this.equipoB.add(inscripcion)
	}
}
