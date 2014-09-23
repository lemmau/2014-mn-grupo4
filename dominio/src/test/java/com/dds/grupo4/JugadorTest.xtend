package com.dds.grupo4

import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.excepciones.HandicapFueraDeRangoException
import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.tipoDeInscripcion.Solidario

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.joda.time.LocalDate

class JugadorTest {

	Jugador diegoEstandar
	Jugador maqiEstandar
	Jugador osvaEstandar
	Jugador leanEstandar
	Jugador gonzaEstandar

	@Before
	def void setUp() {

		diegoEstandar = new Jugador("Diego", "Anazonian","", new LocalDate(1992, 12, 14), new Estandar)
		maqiEstandar = new Jugador("Maximiliano", "Anazonian","", new LocalDate(1992, 04, 05), new Estandar)
		gonzaEstandar = new Jugador("Gonzalo", "Franchino","", new LocalDate(1981, 06, 30), new Estandar)
		osvaEstandar = new Jugador("Osva", "Cornelli","", new LocalDate(1982, 07, 30), new Estandar)
		leanEstandar = new Jugador("Leandro", "Mauro","", new LocalDate(1989, 02, 16), new Estandar)

		diegoEstandar.handicap = 8
	}

	@Test
	def verificarEdadDeJugadores() {
		Assert.assertEquals(22, diegoEstandar.edad)
		Assert.assertEquals(22, maqiEstandar.edad)
		Assert.assertEquals(33, gonzaEstandar.edad)
		Assert.assertEquals(32, osvaEstandar.edad)
		Assert.assertEquals(25, leanEstandar.edad)
	}

	@Test
	def verificarTipoInscripcion() {
		Assert.assertEquals( typeof(Estandar), diegoEstandar.tipoDeInscripcion.class)
	}


	@Test
	def modificarTipoInscripcion() {
		diegoEstandar.cambiarTipoDeInscripcion(new Solidario)
		Assert.assertEquals( typeof(Solidario), diegoEstandar.tipoDeInscripcion.class)
	}

	@Test
	def verificarHandicap() {
		Assert.assertEquals(8, diegoEstandar.handicap)
	}

	@Test(expected=typeof(HandicapFueraDeRangoException))
	def void agregarHandicapFueraDeRango(){
		maqiEstandar.handicap = 11
	}
}
