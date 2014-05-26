package com.dds.grupo4

import com.dds.grupo4.excepciones.BusinessException
import com.dds.grupo4.tipoDeInscripcion.Condicional
import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.tipoDeInscripcion.Solidario
import org.joda.time.DateTime
import org.junit.Assert
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExpectedException
import org.junit.runner.RunWith
import org.powermock.core.classloader.annotations.PrepareForTest
import org.powermock.modules.junit4.PowerMockRunner

import static org.powermock.api.mockito.PowerMockito.*
import com.dds.grupo4.mail.StubMailSender

@RunWith(typeof(PowerMockRunner))
@PrepareForTest(typeof(DateTime))
class PartidoTest {

	Partido partido
	Admin adminJuan
	Interesado diegoEstandar
	Interesado maqiEstandar
	Interesado osvaCondicional1
	Interesado osvaCondicional2
	Interesado leanSolidario
	Interesado pepeSolidario
	Interesado gonzaEstandar
	(Partido)=>Boolean condicionInteresadoCondicional
	(Partido)=>Boolean condicionPorFecha
	Infraccion infraccion
	
	StubMailSender stubMailSender = StubMailSender.instance

	@Rule
	public ExpectedException expectedEx = ExpectedException.none();

	@Before
	def void setUp() {
		adminJuan = new Admin("juan@gmail.com")
		partido = new Partido(adminJuan)

		mockStatic(typeof(DateTime));
		when(DateTime.now).thenReturn(new DateTime(2014, 5, 21, 14, 32))

		infraccion = new Infraccion("un motivo", DateTime.now.plusDays(5))

		condicionInteresadoCondicional = [Partido partido|
			partido.interesados.filter[interesado|interesado.getEdad > 22].size > 2]

		condicionPorFecha = [Partido partido|!(partido.fechaInicio.getDayOfMonth.equals(21))]

		partido.setFechaInicio(DateTime.now)

		diegoEstandar = new Interesado("Diego", "Anazonian", 23, new Estandar)
		maqiEstandar = new Interesado("Maximiliano", "Anazonian", 23, new Estandar)
		gonzaEstandar = new Interesado("Gonzalo", "Franchino", 33, new Estandar)
		osvaCondicional1 = new Interesado("Osva", "Cornelli", 32, new Condicional(condicionInteresadoCondicional))
		osvaCondicional2 = new Interesado("Osva", "Cornelli", 22, new Condicional(condicionPorFecha))
		leanSolidario = new Interesado("Leandro", "Mauro", 25, new Solidario)
		pepeSolidario = new Interesado("Leandro", "Mauro", 25, new Solidario)

		diegoEstandar.messageSender = stubMailSender
	}

	@Test
	def corroboroPosicionesDeInteresadosSegunOrdenDeInscripciones() {

		partido.inscribirA(diegoEstandar)
		partido.inscribirA(maqiEstandar)
		partido.inscribirA(leanSolidario)
		partido.inscribirA(osvaCondicional1)

		Assert.assertEquals(partido.interesados.get(0), diegoEstandar)
		Assert.assertEquals(partido.interesados.get(1), maqiEstandar)
		Assert.assertEquals(partido.interesados.get(2), leanSolidario)
		Assert.assertEquals(partido.interesados.get(3), osvaCondicional1)

	}

	@Test(expected=typeof(RuntimeException))
	def void corroboroExceptionCuandoHayMenosDeDiezJugadores() {

		partido.inscribirA(diegoEstandar)
		partido.inscribirA(osvaCondicional1)
		partido.inscribirA(maqiEstandar)
		partido.inscribirA(leanSolidario)

		partido.jugadoresFinales
	}

	@Test
	def siAgregoDiezEstandarALoUltimoEsosSonLosQueDebenQuedarComoJugadoresFinales() {

		while (partido.interesados.size < 10) {
			partido.inscribirA(diegoEstandar)
		}

		partido.inscribirA(osvaCondicional1)

		Assert.assertTrue(!partido.jugadoresFinales.contains(osvaCondicional1))
	}

	@Test
	def probarReemplazoDeJugadorCuandoSeLoDaDeBaja() {
		partido.inscribirA(maqiEstandar)
		partido.inscribirA(diegoEstandar)
		
		partido.darDeBajaA(diegoEstandar, infraccion)

		Assert.assertTrue(partido.interesados.contains(maqiEstandar))
		Assert.assertFalse(diegoEstandar.getInfracciones.contains(infraccion))
	}

	@Test
	def multarConInfraccionSiNoTieneReemplazante() {
		expectedEx.expect(typeof(BusinessException))
		expectedEx.expectMessage("No hay reemplazante para este jugador, se lo ha multado por dicho suceso")
		
		partido.inscribirA(diegoEstandar)

		partido.darDeBajaA(diegoEstandar, infraccion)
	}

	def comprobarSiInteresadoCondicionalEsDeplazadoTresLugaresLuegoDeInscribirTresNuevos() {

		partido.inscribirA(diegoEstandar) 
		partido.inscribirA(maqiEstandar) 
		partido.inscribirA(leanSolidario) 
		partido.inscribirA(osvaCondicional1) 
		partido.inscribirA(leanSolidario) 
		partido.inscribirA(pepeSolidario) 

		Assert.assertEquals(partido.interesados.get(5), osvaCondicional1)
	}

	@Test
	def comprobarSiCondicionSeAplicaAlPartidoConExito() {

		partido.inscribirA(gonzaEstandar)
		partido.inscribirA(maqiEstandar)
		partido.inscribirA(leanSolidario)
		partido.inscribirA(osvaCondicional1)

		Assert.assertEquals(osvaCondicional1.estasConfirmado(partido), true)
	}

	@Test
	def comprobarUmbralDe10Jugadores() {

		gonzaEstandar.inscribite(partido)
		maqiEstandar.inscribite(partido)
		leanSolidario.inscribite(partido)
		osvaCondicional1.inscribite(partido)
		gonzaEstandar.inscribite(partido)
		maqiEstandar.inscribite(partido)
		leanSolidario.inscribite(partido)
		osvaCondicional1.inscribite(partido)
		osvaCondicional1.inscribite(partido)
		gonzaEstandar.inscribite(partido)
		maqiEstandar.inscribite(partido)
		leanSolidario.inscribite(partido)
		osvaCondicional1.inscribite(partido)
		gonzaEstandar.inscribite(partido)
		maqiEstandar.inscribite(partido)
		leanSolidario.inscribite(partido)
		osvaCondicional1.inscribite(partido)

		Assert.assertEquals(partido.jugadoresFinales.size, 10)

	}

	@Test
	def chequearEnvioDeMailsDeAmigos() {
		diegoEstandar.agregarAmigo(leanSolidario)
		diegoEstandar.mail = ("diego.anazonian@gmail.com")

		diegoEstandar.inscribite(partido)

		Assert.assertEquals(1,stubMailSender.mailsDe("diego.anazonian@gmail.com").size)
	}

	@Test
	def validarQueUnInteresadoCondicionalAunqueEsteEnListaDeJugadoresNoJueguePorSucondicionImpuestaAlPartido() {
		leanSolidario.inscribite(partido)
		osvaCondicional2.inscribite(partido)

		while (partido.interesados.size < 10) {
			leanSolidario.inscribite(partido)
		}

		osvaCondicional1.inscribite(partido)

		Assert.assertFalse(partido.jugadoresFinales.contains(osvaCondicional2))

	}

	@Test
	def validarQueSeHayanHechoLasCalificaciones(){
		partido.inscribirA(diegoEstandar)
		partido.inscribirA(maqiEstandar)
		partido.inscribirA(diegoEstandar)
		partido.inscribirA(maqiEstandar)
		partido.inscribirA(diegoEstandar)
		partido.inscribirA(maqiEstandar)
		partido.inscribirA(diegoEstandar)
		partido.inscribirA(maqiEstandar)
		partido.inscribirA(diegoEstandar)
		partido.inscribirA(gonzaEstandar)
		
		gonzaEstandar.calificarAlResto(partido.jugadoresFinales, partido )
		Assert.assertEquals(9, gonzaEstandar.calificacionesHechas.size)	
	}
}
