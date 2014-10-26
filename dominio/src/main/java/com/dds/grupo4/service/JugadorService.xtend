package com.dds.grupo4.service

import com.mongodb.DB
import com.dds.grupo4.dominio.Jugador
import com.mongodb.BasicDBObject
import com.mongodb.DBObject
import org.joda.time.format.DateTimeFormatter
import org.joda.time.format.DateTimeFormat
import com.mongodb.BasicDBList
import java.util.List
import com.mongodb.DBCollection
import com.dds.grupo4.dominio.Infraccion
import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.connector.DataBaseConnector

class JugadoresService {
	private final val PLAYERS_COLLECTION = "jugadores"
	private DataBaseConnector dbConnector
	private val DateTimeFormatter formatter = DateTimeFormat.forPattern("yyyy/MM/dd")

	new(DataBaseConnector connector) {
		dbConnector = connector
	}

	def void insertPlayer(Jugador jugador) {
		val DB db = dbConnector.openConnection
		val DBCollection colJugadores = db.getCollection(PLAYERS_COLLECTION)
		colJugadores.insert(mapPlayerAsDbObject(jugador))
		dbConnector.closeConnection
	}

	def eliminarTodosLosJugadores() {
		val DB db = dbConnector.openConnection
		val DBCollection colJugadores = db.getCollection(PLAYERS_COLLECTION)
		colJugadores.remove(
			{
			})
		dbConnector.closeConnection
	}

	def showPlayers() {
		val DB db = dbConnector.openConnection
		val DBCollection collectionPlayers = db.getCollection(PLAYERS_COLLECTION)

		val cursor = collectionPlayers.find

		while (cursor.hasNext) {
			println(cursor.next)
		}
		dbConnector.closeConnection
	}

	private def DBObject mapPlayerAsDbObject(Jugador jugador) {

		return new BasicDBObject("nombre", jugador.nombre).append("apellido", jugador.apellido).append("handicap",
			jugador.handicap).append("id", jugador.id).append("apodo", jugador.apodo).append("fechaNacimiento",
			jugador.fechaNacimiento.toString(formatter)).append("mail", jugador.mail).append(
			"amigos",
			mapPlayersFriend(jugador.amigos)
		).append("partidosJugados", mapPartidosDeUnJugador(jugador.partidosJugados)).append("infracciones",
			mapInfracciones(jugador.infracciones));
	}

	private def BasicDBList mapPartidosDeUnJugador(List<Partido> partidos) {
		val BasicDBList dbl = new BasicDBList
		partidos.forEach[partido|dbl.add(new BasicDBObject("id", partido.id))]
		dbl
	}

	private def BasicDBList mapInfracciones(List<Infraccion> infracciones) {
		val BasicDBList dbl = new BasicDBList
		infracciones.forEach[infraccion|
			dbl.add(new BasicDBObject("motivo", infraccion.motivo).append("fecha", infraccion.fecha.toString(formatter)))]
		dbl
	}

	private def BasicDBList mapPlayersFriend(List<Jugador> amigos) {
		val BasicDBList dbl = new BasicDBList
		amigos.forEach[amigo|
			dbl.add(
				new BasicDBObject("nombre", amigo.nombre).append("apellido", amigo.apellido).append("handicap",
					amigo.handicap).append("id", amigo.id)
			)]
		dbl
	}

}
