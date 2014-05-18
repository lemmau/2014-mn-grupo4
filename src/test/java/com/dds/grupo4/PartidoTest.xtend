package com.dds.grupo4

import org.junit.Test
import org.junit.Before
import org.junit.Assert
import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.tipoDeInscripcion.Condicional
import java.util.List
import org.joda.time.DateTime
import com.dds.grupo4.tipoDeInscripcion.Solidario

class PartidoTest {

	Partido partido
	Interesado diego
	Interesado maqi
	Interesado osva
	Interesado lean
	Interesado pepe
	Interesado gonza
	(List<Interesado>)=>Boolean condicionInteresadoCondicional
	Infraccion infraccion
	
	@Before
	def void setUp() {
		partido = new Partido
		
		infraccion = new Infraccion("un motivo",DateTime.now.plusDays(5))

		condicionInteresadoCondicional = [List<Interesado> interesados|
			interesados.filter[interesado|interesado.getEdad > 22].size > 2]

		diego = new Interesado("Diego", "Anazonian", 23, new Estandar)
		maqi = new Interesado("Maximiliano", "Anazonian", 23, new Estandar)
		gonza = new Interesado("Gonzalo", "Franchino", 33, new Estandar)
		osva = new Interesado("Osva", "Cornelli", 32, new Condicional(condicionInteresadoCondicional))
		lean = new Interesado("Leandro", "Mauro", 25, new Solidario)
		pepe = new Interesado("Leandro", "Mauro", 25, new Solidario)

	}
	
	@Test
	def corroboroPosicionesDeInteresadosSegunOrdenDeInscripciones() {

		partido.inscribirA(diego)
		partido.inscribirA(maqi)
		partido.inscribirA(lean)
		partido.inscribirA(osva)
		
		Assert.assertEquals(partido.interesados.get(0), diego)
		Assert.assertEquals(partido.interesados.get(1), maqi)
		Assert.assertEquals(partido.interesados.get(2), lean)
		Assert.assertEquals(partido.interesados.get(3), osva)

	}

	@Test(expected=typeof(RuntimeException))
	def void corroboroExceptionCuandoHayMenosDeDiezJugadores() {

		//partido.inscribirA(osva)
		partido.inscribirA(diego)
		partido.inscribirA(osva)
		partido.inscribirA(maqi)
		partido.inscribirA(lean)

		partido.jugadoresFinales
	}

	@Test
	def siAgregoDiezEstandarALoUltimoEsosSonLosQueDebenQuedarComoJugadoresFinales() {
		
		while (partido.interesados.size < 10) {
			partido.inscribirA(diego)
		}

		partido.inscribirA(osva)

		Assert.assertTrue(!partido.jugadoresFinales.contains(osva))
	}
	
	@Test
	def probarReemplazoDeJugadorCuandoSeLoDaDeBaja(){
		diego.agregarAmigo(maqi)
		
		partido.inscribirA(diego)
		partido.darDeBajaA(diego,infraccion)
		
		Assert.assertTrue(partido.interesados.contains(maqi))
		Assert.assertFalse(diego.getInfracciones.contains(infraccion))
	}
	
	@Test
	def multarConInfraccionSiNoTieneReemplazante(){
		partido.inscribirA(diego)
		partido.darDeBajaA(diego,infraccion)	
	
		Assert.assertTrue(diego.getInfracciones.contains(infraccion))				
					
	}
	
	def comprobarSiInteresadoCondicionalEsDeplazadoTresLugaresLuegoDeInscribirTresNuevos() {

		partido.inscribirA(diego)	// estandar
		partido.inscribirA(maqi)	// estandar
		partido.inscribirA(lean)	// estandar
		partido.inscribirA(osva)	// CONDICIONAL
		partido.inscribirA(lean)	// solidario
		partido.inscribirA(pepe)	// solidario

		Assert.assertEquals(partido.interesados.get(5), osva)
	}

	@Test
	def comprobarSiCondicionSeAplicaAlPartidoConExito() {

		partido.inscribirA(gonza)
		partido.inscribirA(maqi)
		partido.inscribirA(lean)
		partido.inscribirA(osva)	// condicional

		val (List<Interesado>)=>Boolean condicionPartido = osva.condicionDelPartido

		Assert.assertEquals(condicionPartido.apply(partido.interesados), true)
	}
	
	@Test
	def comprobarUmbralDe10Jugadores() {

		partido.inscribirA(gonza)
		partido.inscribirA(maqi)
		partido.inscribirA(lean)
		partido.inscribirA(osva)
		partido.inscribirA(gonza)
		partido.inscribirA(maqi)
		partido.inscribirA(lean)
		partido.inscribirA(osva)
		partido.inscribirA(osva)
		partido.inscribirA(gonza)
		partido.inscribirA(maqi)
		partido.inscribirA(lean)
		partido.inscribirA(osva)
		partido.inscribirA(gonza)
		partido.inscribirA(maqi)
		partido.inscribirA(lean)
		partido.inscribirA(osva)		

		Assert.assertEquals(partido.jugadoresFinales.size, 10)

	}		

}
