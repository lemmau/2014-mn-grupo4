package com.dds.grupo4

import com.dds.grupo4.home.TodosLosJugadores
import com.dds.grupo4.tipoDeInscripcion.Estandar
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import java.time.LocalDate
import com.dds.grupo4.excepciones.NoExisteJugadorPendienteException

class JugadoresTest {

	TodosLosJugadores todosLosJugadores = new TodosLosJugadores
	Interesado diegoEstandar
	Interesado maqiEstandar
	Interesado osvaEstandar
	Interesado leanEstandar
	Interesado gonzaEstandar
	Interesado lioEstandar

	@Before
	def void setUp() {

		diegoEstandar = new Interesado("Diego", "Anazonian", LocalDate.of(1991, 12, 14), new Estandar)
		maqiEstandar = new Interesado("Maximiliano", "Anazonian", LocalDate.of(1991, 04, 05), new Estandar)
		gonzaEstandar = new Interesado("Gonzalo", "Franchino", LocalDate.of(1981, 06, 30), new Estandar)
		osvaEstandar = new Interesado("Osva", "Cornelli", LocalDate.of(1982, 07, 30), new Estandar)
		leanEstandar = new Interesado("Leandro", "Mauro", LocalDate.of(1989, 02, 16), new Estandar)
		
		lioEstandar = new Interesado("Lionel", "Messi", LocalDate.of(1987, 06, 24), new Estandar)

		// Propongo 5 jugadores candidatos
		todosLosJugadores.proponerJugador(diegoEstandar)
		todosLosJugadores.proponerJugador(maqiEstandar)
		todosLosJugadores.proponerJugador(leanEstandar)
		todosLosJugadores.proponerJugador(osvaEstandar)
		todosLosJugadores.proponerJugador(gonzaEstandar)

	}

	@Test
	def verificoCantInteresadosPendientes() {
		Assert.assertEquals(5, todosLosJugadores.cantInteresadosPendientes)
	}

	@Test
	def void aceptoTodosLosCandidatos() {
		todosLosJugadores.getInteresadosDelSistema.forEach[interesado | todosLosJugadores.aceptarInteresado(interesado) ]
		Assert.assertEquals(5, todosLosJugadores.cantInteresadosAceptados)
	}

	@Test
	def void rechazoTodosLosCandidatos() {
		todosLosJugadores.getInteresadosDelSistema.forEach[interesado | todosLosJugadores.rechazarInteresado(interesado, "Cupo completo") ]
		Assert.assertEquals(5, todosLosJugadores.cantInteresadosRechazados)
	}

	@Test(expected=typeof(NoExisteJugadorPendienteException))
	def void aceptoCandidatoInexistente() {
		todosLosJugadores.aceptarInteresado(lioEstandar)
	}

	@Test(expected=typeof(NoExisteJugadorPendienteException))
	def void rechazoCandidatoInexistente() {
		todosLosJugadores.rechazarInteresado(lioEstandar, "demasiado bueno")
	}

}
