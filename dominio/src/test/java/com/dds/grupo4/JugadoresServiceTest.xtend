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
import com.mongodb.MongoClient

class JugadoresServiceTest {
	val String dataBaseName = "futbol5"
	val DataBaseConnector connector = new DataBaseConnector(dataBaseName)
	val JugadoresService dbService = new JugadoresService(connector)

	Jugador diegoEstandar
	Jugador osvaCondicional1

	@Before
	def void setUp() {
		diegoEstandar = new Jugador("Diego", "Anazonian", "El Diego", new DateTime(1992, 12, 14, 0, 0), new Estandar)
		osvaCondicional1 = new Jugador("Osva", "Cornelli", "", new DateTime(1982, 07, 30, 0, 0),
			new Condicional(Condicion.MAS_DE_DOS_JUGADORES_MAYORES_A_22))

	}

	@Test
	def void insertAPlayer() {
		dbService.insertPlayer(diegoEstandar, JugadoresService.ACCEPTED_PLAYERS)
		dbService.insertPlayer(osvaCondicional1, JugadoresService.ACCEPTED_PLAYERS)
		dbService.showPlayers(JugadoresService.ACCEPTED_PLAYERS)

	}

	@Test
	def void getJugadoresDeLaBase() {
		diegoEstandar.setId(2L)
		dbService.insertPlayer(diegoEstandar, JugadoresService.ACCEPTED_PLAYERS)

		val diegoDeLaBase = dbService.getAllPlayers(JugadoresService.ACCEPTED_PLAYERS).get(0)
		dbService.showPlayers(JugadoresService.ACCEPTED_PLAYERS)

		Assert.assertEquals(diegoDeLaBase.nombre, "Diego")
		Assert.assertEquals(diegoDeLaBase.apellido, "Anazonian")
		Assert.assertEquals(diegoDeLaBase.handicap, 1)
		Assert.assertEquals(diegoDeLaBase.apodo, "El Diego")
		Assert.assertEquals(diegoDeLaBase.fechaNacimiento, new DateTime(1992, 12, 14, 0, 0))
		Assert.assertEquals(diegoDeLaBase.tipoDeInscripcion.class.toString,
			"class com.dds.grupo4.tipoDeInscripcion.Estandar")
	}

	@Test
	def void getJugadorPorId() {
		diegoEstandar.setId(2L)
		dbService.insertPlayer(diegoEstandar, JugadoresService.ACCEPTED_PLAYERS)

		dbService.showPlayers(JugadoresService.ACCEPTED_PLAYERS)
		val Jugador diegoDeLaBase = dbService.getPlayer(2L, JugadoresService.ACCEPTED_PLAYERS)

		Assert.assertEquals(diegoDeLaBase.nombre, "Diego")
		Assert.assertEquals(diegoDeLaBase.apellido, "Anazonian")
		Assert.assertEquals(diegoDeLaBase.handicap, 1)
		Assert.assertEquals(diegoDeLaBase.apodo, "El Diego")
		Assert.assertEquals(diegoDeLaBase.fechaNacimiento, new DateTime(1992, 12, 14, 0, 0))
		Assert.assertEquals(diegoDeLaBase.tipoDeInscripcion.class.toString,
			"class com.dds.grupo4.tipoDeInscripcion.Estandar")
	}

	@Test
	def void crearDBInMongo() {
		val MongoClient mongo = new MongoClient("localhost", 27017);
		mongo.getDB("futbol5")
		println("hola")
	}
	
	@Test
	def void insertaryEliminarUnJugadorPorId(){
		dbService.insertPlayer(diegoEstandar,JugadoresService.ACCEPTED_PLAYERS)
		dbService.insertPlayer(osvaCondicional1,JugadoresService.ACCEPTED_PLAYERS)
		dbService.showPlayers(JugadoresService.ACCEPTED_PLAYERS)
		
		val deleted =  dbService.remove(osvaCondicional1,JugadoresService.ACCEPTED_PLAYERS)
		
		dbService.showPlayers(JugadoresService.ACCEPTED_PLAYERS)
		Assert.assertTrue(deleted == true)
		
	}
	@After
	def void after() {
		dbService.eliminarTodosLosJugadores(JugadoresService.ACCEPTED_PLAYERS)
	}

}
