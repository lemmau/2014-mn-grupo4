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
import java.util.ArrayList
import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.tipoDeInscripcion.Condicional
import com.dds.grupo4.tipoDeInscripcion.Solidario
import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion
import org.joda.time.DateTime
import java.util.Iterator
import org.joda.time.LocalDateTime
import com.mongodb.DBCursor

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

	def Jugador getPlayer(Long id) {
		val DB db = dbConnector.openConnection
		val DBCollection colJugadores = db.getCollection(PLAYERS_COLLECTION)
		val Jugador jugadorBuscado = transformObjectsAsPLayers(colJugadores.find(new BasicDBObject("id",id))).get(0)
		dbConnector.closeConnection
		jugadorBuscado
	}

	def List<Jugador> getAllPlayers() {
		val DB db = dbConnector.openConnection
		val DBCollection colJugadores = db.getCollection(PLAYERS_COLLECTION)
		val List<Jugador> jugadores = mapFromDbObjectsToPlayers(colJugadores)
		dbConnector.closeConnection
		jugadores
	}

	private def List<Jugador> mapFromDbObjectsToPlayers(DBCollection collectionPlayers) {
		transformObjectsAsPLayers(collectionPlayers.find)
	}
	
	def List<Jugador> transformObjectsAsPLayers(DBCursor playersObjectCursor){
		val List<Jugador> jugadores = new ArrayList
		
		while (playersObjectCursor.hasNext) {
			val DBObject jugadorObject = playersObjectCursor.next
			val Jugador jugador = convertFromDBObjectToJugador(jugadorObject)
			jugadores.add(jugador)
		}
		jugadores
	}

	private def Jugador convertFromDBObjectToJugador(DBObject jugadorObject) {
		val Jugador jugador = new Jugador

		jugador.setNombre(jugadorObject.get("nombre").toString)
		jugador.setApellido(jugadorObject.get("apellido").toString)
		jugador.setHandicap(new Integer(jugadorObject.get("handicap").toString))
		jugador.setId(new Long(jugadorObject.get("id").toString))
		jugador.setTipoDeInscripcion(mapInscripcionFromString(jugadorObject))
		jugador.setApodo(jugadorObject.get("apodo").toString)
		jugador.setFechaNacimiento(new DateTime(jugadorObject.get("fechaNacimiento").toString.replace("/", "-")))
		jugador.setInfracciones(mapInfraccionesFromObject(jugadorObject.get("infracciones") as BasicDBList))

		jugador
	}

	def List<Infraccion> mapInfraccionesFromObject(BasicDBList infraccionesObject) {
		val List<Infraccion> infracciones = new ArrayList

		val Iterator<Object> fields = infraccionesObject.iterator

		while (fields.hasNext) {
			val BasicDBObject field = fields.next as BasicDBObject

			val infraccion = new Infraccion(field.get("motivo").toString,
				new LocalDateTime(field.get("fecha").toString.replace("/", "-")))

			infracciones.add(infraccion)

		}

		infracciones
	}

	private def TipoDeInscripcion mapInscripcionFromString(DBObject playerObject) {
		val String inscripcion = playerObject.get("inscripcion").toString

		switch inscripcion {
			case "ESTANDAR":
				new Estandar
			case "SOLIDARIO":
				new Solidario
			case "CONDICIONAL": {
				val String condicion = playerObject.get("condicion").toString;
				new Condicional(condicion)
			}
		}
	}

	def eliminarTodosLosJugadores() {
		val DB db = dbConnector.openConnection
		val DBCollection colJugadores = db.getCollection(PLAYERS_COLLECTION)
		colJugadores.remove(new BasicDBObject)
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

	private def BasicDBObject mapPlayerAsDbObject(Jugador jugador) {

		val BasicDBObject dbobject = new BasicDBObject("inscripcion", jugador.tipoDeInscripcion.toString).append(
			"nombre", jugador.nombre).append("apellido", jugador.apellido).append("handicap", jugador.handicap).append("id",
			jugador.id).append("apodo", jugador.apodo).append("fechaNacimiento", jugador.fechaNacimiento.toString(formatter)).
			append("mail", jugador.mail).append(
				"amigos",
				mapPlayersFriend(jugador.amigos)
			).append("partidosJugados", mapPartidosDeUnJugador(jugador.partidosJugados)).append("infracciones",
				mapInfracciones(jugador.infracciones));

		if (jugador.tipoDeInscripcion.toString == "CONDICIONAL") {
			dbobject.append("condicion", jugador.tipoDeInscripcion.nombreCondicion)
		}

		dbobject
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
