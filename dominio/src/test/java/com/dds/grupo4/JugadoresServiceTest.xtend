package com.dds.grupo4

import org.junit.Before
import org.junit.Test
import com.dds.grupo4.dominio.Jugador
import org.joda.time.DateTime
import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.service.JugadoresService
import org.junit.After
import com.dds.grupo4.connector.DataBaseConnector
import com.dds.grupo4.tipoDeInscripcion.Condicional
import com.dds.grupo4.tipoDeInscripcion.Condicion
import org.junit.Assert

class PersistenceTest {
	val String dataBaseName = "futbol5"
	val DataBaseConnector connector = new DataBaseConnector(dataBaseName)
	val JugadoresService dbService = new JugadoresService(connector)

	Jugador diegoEstandar
	Jugador osvaCondicional1

	@Before
	def void setUp() {
		diegoEstandar = new Jugador("Diego", "Anazonian", "El Diego", new DateTime(1992, 12, 14, 0, 0), new Estandar)
		osvaCondicional1 = new Jugador("Osva", "Cornelli", "", new DateTime(1982, 07, 30, 0, 0),new Condicional(Condicion.MAS_DE_DOS_JUGADORES_MAYORES_A_22))

	}

	@Test
	def void insertAPlayer() {
		dbService.insertPlayer(diegoEstandar)
		dbService.insertPlayer(osvaCondicional1)
		dbService.showPlayers

	}
	
	@Test
	def void getJugadoresDeLaBase(){
		diegoEstandar.setId(2L)
		dbService.insertPlayer(diegoEstandar)

		val diegoDeLaBase = dbService.getAllPlayers.get(0)
		dbService.showPlayers
		
		Assert.assertEquals(diegoDeLaBase.nombre,"Diego")
		Assert.assertEquals(diegoDeLaBase.apellido,"Anazonian")
		Assert.assertEquals(diegoDeLaBase.handicap,1)
		Assert.assertEquals(diegoDeLaBase.apodo,"El Diego")
		Assert.assertEquals(diegoDeLaBase.fechaNacimiento,new DateTime(1992, 12, 14, 0, 0))
		Assert.assertEquals(diegoDeLaBase.tipoDeInscripcion.class.toString,"class com.dds.grupo4.tipoDeInscripcion.Estandar")
	}
	
	@Test
	def void getJugadorPorId(){
		diegoEstandar.setId(2L)
		dbService.insertPlayer(diegoEstandar)
		
		dbService.showPlayers
		val Jugador diegoDeLaBase = dbService.getPlayer(2L)
		
		Assert.assertEquals(diegoDeLaBase.nombre,"Diego")
		Assert.assertEquals(diegoDeLaBase.apellido,"Anazonian")
		Assert.assertEquals(diegoDeLaBase.handicap,1)
		Assert.assertEquals(diegoDeLaBase.apodo,"El Diego")
		Assert.assertEquals(diegoDeLaBase.fechaNacimiento,new DateTime(1992, 12, 14, 0, 0))
		Assert.assertEquals(diegoDeLaBase.tipoDeInscripcion.class.toString,"class com.dds.grupo4.tipoDeInscripcion.Estandar")
	}
	
	@After
	def void after(){
		dbService.eliminarTodosLosJugadores	
	}

}
