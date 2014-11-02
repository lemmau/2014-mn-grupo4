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
import com.sun.org.apache.xml.internal.dtm.ref.DTMDefaultBaseIterators.ParentIterator
import com.dds.grupo4.divisorequipos.ParImpar
import com.dds.grupo4.ordenamiento.CriterioOrden
import java.util.List
import java.util.ArrayList
import com.dds.grupo4.ordenamiento.Handicap
import org.junit.Assert

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
	Jugador leanSolidario2
	Jugador pepeSolidario2

	List<CriterioOrden> ordenamiento
	val String dataBaseName = "futbol5"
	val DataBaseConnector connector = new DataBaseConnector(dataBaseName)
	val PartidoService partidoService = new PartidoService(connector)

	@Before
	def void setUp() {
		partidoService.eliminarTodo
		
		adminJuan = new Admin("juan@gmail.com")
		adminJuan.setApellido("Peregil")
		adminJuan.setNombre("Juan")
		partido = new Partido(adminJuan)
		partido.setFechaInicio(new DateTime(2014, 06, 21, 21, 00))


		lioEstandar = new Jugador("Lionel", "Messi","", new DateTime(1987, 06, 24,0,0), new Estandar,2)
		diegoEstandar = new Jugador("Diego", "Anazonian","", new DateTime(1992, 12, 14,0,0), new Estandar,3)
		maqiEstandar = new Jugador("Maximiliano", "Anazonian","", new DateTime(1992, 04, 05,0,0), new Estandar,4)
		gonzaEstandar = new Jugador("Gonzalo", "Franchino","",  new DateTime(1981, 06, 30,0,0), new Estandar,5)
		osvaCondicional1 = new Jugador("Osva", "Cornelli","", new DateTime(1982, 07, 30,0,0), new Condicional(Condicion.MAS_DE_DOS_JUGADORES_MAYORES_A_22),4)
		osvaCondicional2 = new Jugador("Osva", "Cornelli","", new DateTime(1982, 07, 30,0,0), new Condicional(Condicion.EL_DIA_DEL_MES_DEBE_SER_21),7)
		leanSolidario = new Jugador("Leandro", "Mauro","",  new DateTime(1989, 02, 16,0,0), new Solidario,9)
		pepeSolidario = new Jugador("Leandro", "Mauro","",  new DateTime(1933, 02, 16,0,0), new Solidario,5)
		leanSolidario2 = new Jugador("Leandro", "Mauro","",  new DateTime(1930, 02, 16,0,0), new Solidario,4)
		pepeSolidario2 = new Jugador("Leandro", "Mauro","",  new DateTime(1940, 02, 16,0,0), new Solidario,1)
		

		ordenamiento = newArrayList(new Handicap)
	}
	
	@Test
	def void persisitirUnPartido(){
		partido.setNombre("River Vs Boca")
		
		partido.inscribirA(diegoEstandar)
		partido.inscribirA(maqiEstandar)
		partido.inscribirA(leanSolidario)
		partido.inscribirA(osvaCondicional1)
		
		partidoService.insertarPartido(partido)
		partidoService.showMatches
	}
	
	@Test
	def void updateMatch(){
		val Long idPartido = partido.id
		var Partido partidoDeLaBase 
		
		partido.setNombre("Nombre 1")
		partidoService.insertarPartido(partido)
		
		partidoDeLaBase = partidoService.getPartido(idPartido)
		
		Assert.assertTrue(partidoDeLaBase.id == idPartido)
		Assert.assertTrue(partidoDeLaBase.nombre == "Nombre 1")
		
		partido.setNombre("Nombre 2")
		partidoService.updateMatch(partido)
		
		partidoDeLaBase = partidoService.getPartido(idPartido)
		Assert.assertTrue(partidoDeLaBase.id == idPartido)
		Assert.assertTrue(partidoDeLaBase.nombre == "Nombre 2")
	}
	
	@Test
	def void corroborarConsistenciaTrayendoUnPartidoDeLaBase(){
		val Long idPartido = partido.id
		partido.setNombre("River Vs Boca")
		
		partido.inscribirA(diegoEstandar)
		partido.inscribirA(lioEstandar)
		partido.inscribirA(maqiEstandar)
		partido.inscribirA(gonzaEstandar)
		partido.inscribirA(osvaCondicional1)
		partido.inscribirA(osvaCondicional2)
		partido.inscribirA(leanSolidario)
		partido.inscribirA(leanSolidario2)
		partido.inscribirA(pepeSolidario)
		partido.inscribirA(pepeSolidario2)
		
		println(partido.inscripciones.size)
		partido.generarEquipo(new ParImpar(partido),ordenamiento)
		
		partidoService.insertarPartido(partido)
		partidoService.showMatches
		val Partido partidos = partidoService.getPartido(idPartido)
		println("partido :" + partidos)
	}

	@After
	def void eliminarTodo() {
		partidoService.eliminarTodo()
	}

}
