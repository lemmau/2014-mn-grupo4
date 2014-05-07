package com.dds.grupo4

import org.junit.Test
import org.junit.Before
import org.junit.Assert
import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.tipoDeInscripcion.Condicional
import com.dds.grupo4.tipoDeInscripcion.Solidaria
import java.util.List

class PartidoTest {

	Partido partido
	Interesado diego
	Interesado maqi
	Interesado osva
	Interesado lean
	(List<Interesado>)=>Boolean condicionInteresadoCondicional

	@Before
	def void setUp() {
		partido = new Partido

		condicionInteresadoCondicional = [List<Interesado> interesados|
			interesados.filter[interesado|interesado.getEdad > 22].size > 2]

		diego = new Interesado("Diego", "Anazonian", 23, new Estandar)
		maqi = new Interesado("Maximiliano", "Anazonian", 23, new Estandar)
		osva = new Interesado("Osva", "Cornelli", 32, new Condicional(condicionInteresadoCondicional))
		lean = new Interesado("Leandro", "Mauro", 25, new Solidaria)
	}

	@Test
	def corroboroComoPrioridadDeJugadoresEnListaDeInt() {

		partido.inscribirA(diego);
		partido.inscribirA(maqi);
		partido.inscribirA(lean);
		partido.inscribirA(osva);

		Assert.assertEquals(partido.interesados.get(0), maqi);
		Assert.assertEquals(partido.interesados.get(1), diego);
		Assert.assertEquals(partido.interesados.get(2), lean);
		Assert.assertEquals(partido.interesados.get(3), osva);

	}

	@Test(expected=typeof(RuntimeException))
	def void corroboroExceptionCuandoHayMenosDeDiezJugadores() {

		//partido.inscribirA(osva);
		partido.inscribirA(diego);
		partido.inscribirA(osva);
		partido.inscribirA(maqi);
		partido.inscribirA(lean);

		partido.jugadoresFinales
	}

	@Test
	def siAgregoDiezEstandarALoUltimoEsosSonLosQueDebenQuedarComoJugadoresFinales() {

		
		while (partido.interesados.size < 11) {
			partido.inscribirA(diego);
		}

		partido.inscribirA(osva);

		Assert.assertTrue(!partido.jugadoresFinales.contains(osva))

	}

}
