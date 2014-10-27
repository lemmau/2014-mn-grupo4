package com.dds.grupo4

import com.dds.grupo4.service.PartidoService
import com.dds.grupo4.connector.DataBaseConnector
import org.junit.Test
import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.dominio.Jugador
import javax.ejb.BeforeCompletion
import org.junit.Before
import com.dds.grupo4.dominio.Admin
import org.joda.time.DateTime
import com.dds.grupo4.observadores.InscripcionAmigo
import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.tipoDeInscripcion.Condicional
import com.dds.grupo4.tipoDeInscripcion.Solidario
import com.dds.grupo4.tipoDeInscripcion.Condicion
import java.util.concurrent.locks.AbstractQueuedLongSynchronizer.ConditionObject
import org.junit.After

class PartidosServiceTest {
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

	val String dataBaseName = "futbol5"
	val DataBaseConnector connector = new DataBaseConnector(dataBaseName)
	val PartidoService partidoService = new PartidoService(connector)

	@Before
	def void setUp() {
		adminJuan = new Admin("juan@gmail.com")
		partido = new Partido(adminJuan)
		partido.setFechaInicio(new DateTime(2014, 06, 12, 21, 00))

		lioEstandar = new Jugador("Lionel", "Messi", "", new DateTime(1987, 06, 24, 0, 0), new Estandar)
		diegoEstandar = new Jugador("Diego", "Anazonian", "", new DateTime(1992, 12, 14, 0, 0), new Estandar)
		maqiEstandar = new Jugador("Maximiliano", "Anazonian", "", new DateTime(1992, 04, 05, 0, 0), new Estandar)
		gonzaEstandar = new Jugador("Gonzalo", "Franchino", "", new DateTime(1981, 06, 30, 0, 0), new Estandar)
		osvaCondicional1 = new Jugador("Osva", "Cornelli", "", new DateTime(1982, 07, 30, 0, 0),
			new Condicional(Condicion.MAS_DE_DOS_JUGADORES_MAYORES_A_22))
		osvaCondicional2 = new Jugador("Osva", "Cornelli", "", new DateTime(1982, 07, 30, 0, 0),
			new Condicional(Condicion.EL_DIA_DEL_MES_DEBE_SER_21))
		leanSolidario = new Jugador("Leandro", "Mauro", "", new DateTime(1989, 02, 16, 0, 0), new Solidario)
		pepeSolidario = new Jugador("Leandro", "Mauro", "", new DateTime(1989, 02, 16, 0, 0), new Solidario)

	}
	
	@Test
	def void persisitirUnPartido(){
		
		partido.inscribirA(diegoEstandar)
		partido.inscribirA(maqiEstandar)
		partido.inscribirA(leanSolidario)
		partido.inscribirA(osvaCondicional1)
		
		partidoService.insertarPartido(partido)
		partidoService.showMatches
		
	}
	
	@Test
	def void traerUnPartidoDeLaBase(){
//		partido.inscribirA(diegoEstandar)
//		partido.inscribirA(maqiEstandar)
//		partido.inscribirA(leanSolidario)
//		partido.inscribirA(osvaCondicional1)
//		
//		partidoService.insertarPartido(partido)
//		partidoService.
	}

	@After
	def void eliminarTodo() {
		partidoService.eliminarTodo()
	}

}
