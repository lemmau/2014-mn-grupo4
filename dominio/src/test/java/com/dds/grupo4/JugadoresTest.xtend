package com.dds.grupo4

import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.excepciones.NoExisteJugadorPendienteException
import com.dds.grupo4.home.TodosLosJugadores
import com.dds.grupo4.tipoDeInscripcion.Estandar

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.joda.time.LocalDate

class JugadoresTest {

	TodosLosJugadores todosLosJugadores = TodosLosJugadores.instance
	Jugador diegoEstandar
	Jugador maqiEstandar
	Jugador osvaEstandar
	Jugador leanEstandar
	Jugador gonzaEstandar
	Jugador lioEstandar

	@Before
	def void setUp() {
		
		todosLosJugadores.borrarTodo
		
		diegoEstandar = new Jugador("Diego","Anazonian","", new LocalDate(1991, 12, 14), new Estandar)
		maqiEstandar = new Jugador("Maximiliano","Anazonian","", new LocalDate(1991, 04, 05), new Estandar)
		gonzaEstandar = new Jugador("Gonzalo", "Franchino","", new LocalDate(1981, 06, 30), new Estandar)
		osvaEstandar = new Jugador("Osva", "Cornelli","", new LocalDate(1982, 07, 30), new Estandar)
		leanEstandar = new Jugador("Leandro", "Mauro","", new LocalDate(1989, 02, 16), new Estandar)
		
		lioEstandar = new Jugador("Lionel", "Messi","", new LocalDate(1987, 06, 24), new Estandar)

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

	@Test
	def void aceptoUnCandidato() {
		todosLosJugadores.aceptarInteresado(diegoEstandar)
		Assert.assertTrue( todosLosJugadores.esUnInteresadoAceptado(diegoEstandar) )
	}

	@Test
	def void rechazoUnCandidato() {
		todosLosJugadores.rechazarInteresado(maqiEstandar, "Cupo completo")
		Assert.assertTrue( todosLosJugadores.esUnInteresadoRechazado(maqiEstandar) )
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
