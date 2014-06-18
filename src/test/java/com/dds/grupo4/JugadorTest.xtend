package com.dds.grupo4

import java.time.LocalDate

import org.junit.Assert
import org.junit.Before
import org.junit.Test

import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.tipoDeInscripcion.Solidario

class JugadorTest {

	Interesado diegoEstandar
	Interesado maqiEstandar
	Interesado osvaEstandar
	Interesado leanEstandar
	Interesado gonzaEstandar

	@Before
	def void setUp() {

		diegoEstandar = new Interesado("Diego", "Anazonian", LocalDate.of(1992, 12, 14), new Estandar)
		maqiEstandar = new Interesado("Maximiliano", "Anazonian", LocalDate.of(1992, 04, 05), new Estandar)
		gonzaEstandar = new Interesado("Gonzalo", "Franchino", LocalDate.of(1981, 06, 30), new Estandar)
		osvaEstandar = new Interesado("Osva", "Cornelli", LocalDate.of(1982, 07, 30), new Estandar)
		leanEstandar = new Interesado("Leandro", "Mauro", LocalDate.of(1989, 02, 16), new Estandar)
		
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
	def verificarHandicap() {
		Assert.assertEquals(8, diegoEstandar.handicap)
	}

	@Test
	def modificarTipoInscripcion() {
		diegoEstandar.cambiarTipoDeInscripcion(new Solidario)
		Assert.assertEquals( typeof(Solidario), diegoEstandar.tipoDeInscripcion.class)
	}

}
