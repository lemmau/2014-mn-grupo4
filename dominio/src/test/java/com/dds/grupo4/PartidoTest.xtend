package com.dds.grupo4

import com.dds.grupo4.divisorequipos.NumerosFijos
import com.dds.grupo4.dominio.Admin
import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.excepciones.BusinessException
import com.dds.grupo4.excepciones.NoEsJugadorDelPartidoException
import com.dds.grupo4.excepciones.SuperaMaximoCalificacionesException
import com.dds.grupo4.observadores.InscripcionAmigo
import com.dds.grupo4.ordenamiento.Handicap
import com.dds.grupo4.tipoDeInscripcion.Condicion
import com.dds.grupo4.tipoDeInscripcion.Condicional
import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.tipoDeInscripcion.Solidario
import java.util.ArrayList
import java.util.List
import org.joda.time.DateTime
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import com.dds.grupo4.ordenamiento.CriterioOrden
import com.dds.grupo4.dominio.Inscripcion

class PartidoTest {

	Partido partido
	Admin adminJuan

	Jugador lioEstandar
	Jugador diegoEstandar
	Jugador maqiEstandar
	Jugador osvaCondicional1
	Jugador osvaCondicional2
	Jugador leanSolidario
	Jugador pepeSolidario
	Jugador gonzaEstandar
	Jugador pepeSolidario1
	Jugador pepeSolidario2
	Jugador lioEstandar1
	Jugador lioEstandar3
	List<Jugador> jugadores = new ArrayList
	//Calificacion calificacion

	StubMailSender stubMailSender = StubMailSender.instance

	@Before
	def void setUp() {

		adminJuan = new Admin("juan@gmail.com")
		partido = new Partido(adminJuan)
		partido.setFechaInicio(new DateTime(2014, 06, 12, 21, 00))
		partido.agregarObservador(new InscripcionAmigo(partido, stubMailSender))

		lioEstandar3 = new Jugador("Lionela", "Messi","", new DateTime(1987, 06, 21,0,0), new Estandar)
		lioEstandar1 = new Jugador("Lionelaso", "Messi","", new DateTime(1987, 06, 21,0,0), new Estandar)
		lioEstandar = new Jugador("Lionel", "Messi","", new DateTime(1987, 06, 21,0,0), new Estandar)
		diegoEstandar = new Jugador("Diego", "Anazonian","", new DateTime(1992, 12, 14,0,0), new Estandar)
		maqiEstandar = new Jugador("Maximiliano", "Anazonian","", new DateTime(1992, 04, 05,0,0), new Estandar)
		gonzaEstandar = new Jugador("Gonzalo", "Franchino","",  new DateTime(1981, 06, 21,0,0), new Estandar)
		osvaCondicional1 = new Jugador("Osva", "Cornelli","", new DateTime(1982, 07, 30,0,0), new Condicional(Condicion.MAS_DE_DOS_JUGADORES_MAYORES_A_22))
		osvaCondicional2 = new Jugador("Osva", "Cornelli","", new DateTime(1982, 07, 30,0,0), new Condicional(Condicion.EL_DIA_DEL_MES_DEBE_SER_21))
		leanSolidario = new Jugador("Leandro", "Mauro","",  new DateTime(1989, 02, 16,0,0), new Solidario)
		pepeSolidario = new Jugador("Leandro", "Mauro","",  new DateTime(1989, 02, 16,0,0), new Solidario)
		pepeSolidario1 = new Jugador("Leandro", "Mauro","",  new DateTime(1989, 02, 16,0,0), new Solidario)
		pepeSolidario2 = new Jugador("Leandro", "Mauro","",  new DateTime(1989, 02, 16,0,0), new Solidario)

		jugadores.add(lioEstandar3)
		jugadores.add(lioEstandar1)
		jugadores.add(lioEstandar)
		jugadores.add(diegoEstandar)
		jugadores.add(maqiEstandar)
		jugadores.add(gonzaEstandar)
		jugadores.add(pepeSolidario1)
		jugadores.add(pepeSolidario1)
		jugadores.add(leanSolidario)
		jugadores.add(pepeSolidario)
		//diegoEstandar.messageSender = stubMailSender
	}
	
	@Test
	def void generarEquipos(){
		val List<CriterioOrden> ordenamiento = new ArrayList()
		ordenamiento.add(new Handicap)
		partido.inscribirTodos(jugadores)
		val List<Inscripcion> inscriptos = partido.generarEquipo(new NumerosFijos(partido),ordenamiento)
		Assert.assertTrue(inscriptos.size == 10)
		
	}

	@Test
	def corroboroPosicionesDeJugadoresSegunOrdenDeInscripciones() {

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
		diegoEstandar.mail = "diego.anazonian@gmail.com"
		leanSolidario.mail = "lean@ddsutn.com"

		diegoEstandar.inscribite(partido)

		Assert.assertEquals(1, stubMailSender.mailsDe(diegoEstandar.mail).size)
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

	// El jugador solo debe aceptar un maximo de 9 calificaciones por partido
	@Test(expected=typeof(SuperaMaximoCalificacionesException))
	def calificarDeMas() {
		while (partido.cantidadInteresados < 10) {
			leanSolidario.inscribite(partido)
		}

		(0..11).forEach[partido.calificarA( leanSolidario, 8, "Muy bien" )]
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
