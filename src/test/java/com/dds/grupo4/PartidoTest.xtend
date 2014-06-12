package com.dds.grupo4

import java.time.LocalDate
import java.time.LocalDateTime

import org.junit.Assert
import org.junit.Before
import org.junit.Test

import com.dds.grupo4.excepciones.BusinessException
import com.dds.grupo4.tipoDeInscripcion.Condicional
import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.tipoDeInscripcion.Solidario


class PartidoTest {

	Partido partido
	Admin adminJuan

	Interesado lioEstandar
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
	//Calificacion calificacion

	StubMailSender stubMailSender = StubMailSender.instance

	@Before
	def void setUp() {
		adminJuan = new Admin("juan@gmail.com")
		partido = new Partido(adminJuan)

		infraccion = new Infraccion("un motivo", LocalDateTime.now().plusDays(5))

		condicionInteresadoCondicional = [Partido partido|
			partido.interesados.filter[interesado|interesado.getEdad > 22].size > 2]

		// Condicion fecha partido que sea dia 21
		condicionPorFecha = [Partido partido | (partido.fechaInicio.getDayOfMonth.equals(21))]

		partido.setFechaInicio(LocalDateTime.now)

		lioEstandar = new Interesado("Lionel", "Messi", LocalDate.now, new Estandar)
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

	@Test(expected=typeof(BusinessException))
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
		partido.inscribirA(diegoEstandar)
		partido.darDeBajaA(diegoEstandar, maqiEstandar)

		Assert.assertTrue(partido.interesados.contains(maqiEstandar))
		Assert.assertFalse(partido.esUnInteresado(diegoEstandar))
		Assert.assertTrue(diegoEstandar.getInfracciones.empty)
	}

	@Test
	def multarConInfraccionSiNoTieneReemplazante() {
		partido.inscribirA(diegoEstandar)
		partido.darDeBajaA(diegoEstandar)
		
		Assert.assertEquals(diegoEstandar.infracciones.size,1)
		Assert.assertFalse(partido.esUnInteresado(diegoEstandar))
	}

	@Test
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

		Assert.assertEquals(1, stubMailSender.mailsDe("diego.anazonian@gmail.com").size)
	}

	@Test
	def validarQueUnInteresadoCondicionalAunqueEsteEnListaDeJugadoresNoJueguePorSucondicionImpuestaAlPartido() {
		leanSolidario.inscribite(partido)
		osvaCondicional2.inscribite(partido)

		while (partido.cantidadInteresados < 10) {
			leanSolidario.inscribite(partido)
		}

		osvaCondicional1.inscribite(partido)

		Assert.assertFalse(partido.jugadoresFinales.contains(osvaCondicional2))

	}

	@Test
	def validarQueSeHayanHechoLasCalificaciones() {
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

		gonzaEstandar.calificarAlResto(partido.jugadoresFinales, partido)
		Assert.assertEquals(9, gonzaEstandar.calificacionesHechas.size)
	}

	@Test
	def calificarJugadorQueJugoPartido() {
		while (partido.cantidadInteresados < 10) {
			diegoEstandar.inscribite(partido)
		}
		partido.calificarA( diegoEstandar, 8, "Muy bien" )
		
		Assert.assertEquals(1, diegoEstandar.cantidadCalificaciones)
	}
 
	@Test(expected=typeof(BusinessException))
	def calificarJugadorQueNoJugoPartido() {
		while (partido.cantidadInteresados < 10) {
			leanSolidario.inscribite(partido)
		}
		partido.calificarA( lioEstandar, 10, "Sos un crack!!" )
	}

	// TODO El jugador solo debe aceptar un maximo de 9 calificaciones por partido
	@Test(expected=typeof(BusinessException))
	def calificarDeMas() {
		while (partido.cantidadInteresados < 10) {
			leanSolidario.inscribite(partido)
		}

		while(diegoEstandar.cantidadCalificaciones < 11)
			partido.calificarA( leanSolidario, 8, "Muy bien" )
	}

/* */


//	@Test
//	def unNuevoInteresadoPropuestoAlAdminNoDebePertenecerAlSistemaHastaQueElAdminLoEvalue() {
//
//		adminJuan.proponerInteresado(osvaCondicional1);
//
//		Assert.assertFalse(TodosLosJugadores.esUnInteresadoDelSistema(osvaCondicional1))
//		Assert.assertFalse(InteresadosRechazados.esUnInteresadoRechazado(osvaCondicional1))
//	}
//	
//	@Test
//	def noSePuedeAprobarUnInteresadoQueNoHaSidoPropuestoAlAdmin(){
//		expectedEx.expect(typeof(BusinessException))
//		expectedEx.expectMessage("El interesado no ha sido propuesto al admin")
//		
//		adminJuan.aprobarInteresado(diegoEstandar)
//	}
//	
//	@Test
//	def noSePuedeDesaprobarUnInteresadoQueNoHaSidoPropuestoAlAdmin(){
//		expectedEx.expect(typeof(BusinessException))
//		expectedEx.expectMessage("El interesado no ha sido propuesto al admin")
//		
//		adminJuan.desaprobarInteresado(diegoEstandar)
//	}
//	
//	@Test
//	def aprobacionDeNuevoInteresadoPorElAdmin(){
//		
//		adminJuan.proponerInteresado(osvaCondicional1);
//		adminJuan.aprobarInteresado(osvaCondicional1)
//		
//		Assert.assertTrue(TodosLosJugadores.esUnInteresadoDelSistema(osvaCondicional1))
//		Assert.assertFalse(InteresadosRechazados.esUnInteresadoRechazado(osvaCondicional1))	
//	}
//	
//	@Test
//	def desaprobarPropuestaDeNuevoInteresado(){
//		adminJuan.proponerInteresado(osvaCondicional1);
//		adminJuan.desaprobarInteresado(osvaCondicional1)
//		
//		Assert.assertFalse(TodosLosJugadores.esUnInteresadoDelSistema(osvaCondicional1))
//		Assert.assertTrue(InteresadosRechazados.esUnInteresadoRechazado(osvaCondicional1))
//	}

//	@Test
//	def comprobarCantidadDeCalificacionesRealizadas() {
//		partido.inscribirA(leanSolidario)
//		partido.inscribirA(diegoEstandar)
//
//		calificacion = new Calificacion(partido, diegoEstandar, 7, "el anti futbol")
//
//		leanSolidario.calificar(diegoEstandar, partido)
//
//		Assert.assertEquals(1, leanSolidario.calificacionesHechas.size)
//	}
//
//	@Test
//	def validarQueTodosLosJugadoresDelPartidoSeCalifiquen() {
//		partido.inscribirA(diegoEstandar)
//		partido.inscribirA(maqiEstandar)
//		partido.inscribirA(maqiEstandar)
//		partido.inscribirA(maqiEstandar)
//		partido.inscribirA(leanSolidario)
//		partido.inscribirA(maqiEstandar)
//		partido.inscribirA(diegoEstandar)
//		partido.inscribirA(maqiEstandar)
//		partido.inscribirA(diegoEstandar)
//		partido.inscribirA(maqiEstandar)
//
//		calificacion = new Calificacion(partido, maqiEstandar, 5, "pecho frio")
//
//		partido.calificarJugadores()
//
//		Assert.assertEquals(9, leanSolidario.calificacionesHechas.size)
//	}

}
