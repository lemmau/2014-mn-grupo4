package com.dds.grupo4

import org.junit.Before
import org.junit.Test
import com.dds.grupo4.dominio.Jugador
import org.joda.time.DateTime
import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.service.JugadoresService
import org.junit.After
import com.dds.grupo4.connector.DataBaseConnector

class PersistenceTest {
	val String dataBaseName = "futbol5"
	val DataBaseConnector connector = new DataBaseConnector(dataBaseName)
	val JugadoresService dbService = new JugadoresService(connector)

	Jugador diegoEstandar
	Jugador maqiEstandar

	@Before
	def void setUp() {
		diegoEstandar = new Jugador("Diego", "Anazonian", "", new DateTime(1992, 12, 14, 0, 0), new Estandar)
		maqiEstandar = new Jugador("Maximiliano", "Anazonian", "", new DateTime(1992, 04, 05, 0, 0), new Estandar)

	}

	@Test
	def void insertAPlayer() {
		dbService.insertPlayer(diegoEstandar)
		dbService.showPlayers

	}
	
	
	
	//@After
	def void after(){
		dbService.eliminarTodosLosJugadores	
	}

}
