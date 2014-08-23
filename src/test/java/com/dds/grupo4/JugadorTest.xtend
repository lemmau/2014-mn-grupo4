package com.dds.grupo4

import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.excepciones.HandicapFueraDeRangoException
import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.tipoDeInscripcion.Solidario

import java.time.LocalDate
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class JugadorTest {

	Jugador diegoEstandar
	Jugador maqiEstandar
	Jugador osvaEstandar
	Jugador leanEstandar
	Jugador gonzaEstandar

	@Before
	def void setUp() {

		diegoEstandar = new Jugador("Diego", "Anazonian", LocalDate.of(1992, 12, 14), new Estandar)
		maqiEstandar = new Jugador("Maximiliano", "Anazonian", LocalDate.of(1992, 04, 05), new Estandar)
		gonzaEstandar = new Jugador("Gonzalo", "Franchino", LocalDate.of(1981, 06, 30), new Estandar)
		osvaEstandar = new Jugador("Osva", "Cornelli", LocalDate.of(1982, 07, 30), new Estandar)
		leanEstandar = new Jugador("Leandro", "Mauro", LocalDate.of(1989, 02, 16), new Estandar)

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
	def verificarCantInfracciones() {
		Assert.assertEquals(0, diegoEstandar.cantidadInfracciones)
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
