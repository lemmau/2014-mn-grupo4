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
import com.dds.grupo4.excepciones.SuperaMaximoCalificacionesException
import com.dds.grupo4.excepciones.NoEsJugadorDelPartidoException

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

	//Calificacion calificacion

	StubMailSender stubMailSender = StubMailSender.instance

	@Before
	def void setUp() {

		adminJuan = new Admin("juan@gmail.com")
		partido = new Partido(adminJuan)
		partido.setFechaInicio(LocalDateTime.of(2014, 06, 12, 21, 00))

		condicionInteresadoCondicional = [Partido partido|
			partido.inscripciones.filter[inscripcion|inscripcion.jugador.edad > 22].size > 2]

		// Condicion fecha partido que sea dia 21
		condicionPorFecha = [Partido partido | (partido.fechaInicio.getDayOfMonth.equals(21))]

		lioEstandar = new Interesado("Lionel", "Messi", LocalDate.of(1987, 06, 24), new Estandar)
		diegoEstandar = new Interesado("Diego", "Anazonian", LocalDate.of(1992, 12, 14), new Estandar)
		maqiEstandar = new Interesado("Maximiliano", "Anazonian", LocalDate.of(1992, 04, 05), new Estandar)
		gonzaEstandar = new Interesado("Gonzalo", "Franchino",  LocalDate.of(1981, 06, 30), new Estandar)
		osvaCondicional1 = new Interesado("Osva", "Cornelli", LocalDate.of(1982, 07, 30), new Condicional(condicionInteresadoCondicional))
		osvaCondicional2 = new Interesado("Osva", "Cornelli", LocalDate.of(1982, 07, 30), new Condicional(condicionPorFecha))
		leanSolidario = new Interesado("Leandro", "Mauro",  LocalDate.of(1989, 02, 16), new Solidario)
		pepeSolidario = new Interesado("Leandro", "Mauro",  LocalDate.of(1989, 02, 16), new Solidario)

		diegoEstandar.messageSender = stubMailSender
	}

	@Test
	def corroboroPosicionesDeInteresadosSegunOrdenDeInscripciones() {

		partido.inscribirA(diegoEstandar)
		partido.inscribirA(maqiEstandar)
		partido.inscribirA(leanSolidario)
		partido.inscribirA(osvaCondicional1)

		Assert.assertEquals(partido.inscripciones.get(0).jugador, diegoEstandar)
		Assert.assertEquals(partido.inscripciones.get(1).jugador, maqiEstandar)
		Assert.assertEquals(partido.inscripciones.get(2).jugador, leanSolidario)
		Assert.assertEquals(partido.inscripciones.get(3).jugador, osvaCondicional1)

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

		while (partido.cantidadInteresados < 10) {
			partido.inscribirA(diegoEstandar)
		}

		partido.inscribirA(osvaCondicional1)

		Assert.assertFalse(partido.esUnJugadorFinal(osvaCondicional1))
	}

	@Test
	def probarReemplazoDeJugadorCuandoSeLoDaDeBaja() {
		partido.inscribirA(diegoEstandar)
		partido.darDeBajaA(diegoEstandar, maqiEstandar)

		Assert.assertTrue(partido.esUnInteresado(maqiEstandar))
		Assert.assertFalse(partido.esUnInteresado(diegoEstandar))
		Assert.assertEquals(0, diegoEstandar.cantidadInfracciones)
	}

	@Test
	def multarConInfraccionSiNoTieneReemplazante() {
		partido.inscribirA(diegoEstandar)
		partido.darDeBajaA(diegoEstandar)
		
		Assert.assertEquals(1, diegoEstandar.cantidadInfracciones)
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

		Assert.assertEquals(partido.inscripciones.get(5).jugador, osvaCondicional1)
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
	def calificarJugadorQueJugoPartido() {
		while (partido.cantidadInteresados < 10) {
			diegoEstandar.inscribite(partido)
		}
		partido.calificarA( diegoEstandar, 8, "Muy bien" )
		
		Assert.assertEquals(1, partido.obtenerJugadorFinal(diegoEstandar).cantidadCalificaciones)
	}

	@Test(expected=typeof(NoEsJugadorDelPartidoException))
	def calificarJugadorQueNoJugoPartido() {
		while (partido.cantidadInteresados < 10) {
			leanSolidario.inscribite(partido)
		}
		partido.calificarA( lioEstandar, 10, "Sos un crack!!" )
	}

	// TODO El jugador solo debe aceptar un maximo de 9 calificaciones por partido
	@Test(expected=typeof(SuperaMaximoCalificacionesException))
	def calificarDeMas() {
		while (partido.cantidadInteresados < 10) {
			leanSolidario.inscribite(partido)
		}

		while(partido.cantidadCalificaciones(leanSolidario) < 11)
			partido.calificarA( leanSolidario, 8, "Muy bien" )
	}


/* */


//	@Test
//	def validarQueSeHayanHechoLasCalificaciones() {
//		partido.inscribirA(diegoEstandar)
//		partido.inscribirA(maqiEstandar)
//		partido.inscribirA(diegoEstandar)
//		partido.inscribirA(maqiEstandar)
//		partido.inscribirA(diegoEstandar)
//		partido.inscribirA(maqiEstandar)
//		partido.inscribirA(diegoEstandar)
//		partido.inscribirA(maqiEstandar)
//		partido.inscribirA(diegoEstandar)
//		partido.inscribirA(gonzaEstandar)
//
//		gonzaEstandar.calificarAlResto(partido.jugadoresFinales, partido)
//		Assert.assertEquals(9, gonzaEstandar.calificacionesHechas.size)
//	}


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
