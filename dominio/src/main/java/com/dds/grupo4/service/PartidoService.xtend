package com.dds.grupo4.service

import com.dds.grupo4.connector.DataBaseConnector
import com.dds.grupo4.dominio.Partido
import com.mongodb.DB
import com.mongodb.DBCollection
import com.mongodb.BasicDBObject
import java.util.List
import objectMapper.ObjectMapper
import java.util.ArrayList
import com.mongodb.DBObject

class PartidoService {
	private final val MATCHES_COLLECTION = "partidos"
	private DataBaseConnector dbConnector
	private List<Partido> partidosCache

	new(DataBaseConnector connector) {
		dbConnector = connector
		partidosCache = new ArrayList
	}

	def void updateMatch(Partido partido) {
		val DB db = dbConnector.openConnection
		val DBCollection colMatches = db.getCollection(MATCHES_COLLECTION)
		val DBObject unmodified = colMatches.findOne(new BasicDBObject("id", partido.id))
		val DBObject modified = ObjectMapper.fromMatchToDBObject(partido)
		colMatches.update(unmodified, modified)
		dbConnector.closeConnection
	}

	def showMatches() {
		val DB db = dbConnector.openConnection
		val DBCollection collectionPlayers = db.getCollection(MATCHES_COLLECTION)

		val cursor = collectionPlayers.find(); //TODO limitar la cantidad de amigos que trae de la base

		while (cursor.hasNext) {
			println(cursor.next)
		}
		dbConnector.closeConnection
	}

	def Partido getPartido(Long id) {
		val DB db = dbConnector.openConnection
		val DBCollection colMatches = db.getCollection(MATCHES_COLLECTION)
		val Partido partido = ObjectMapper.buildMatchesFromCursor(colMatches.find(new BasicDBObject("id", id))).get(0)
		dbConnector.closeConnection
		partido
	}

	def List<Partido> getPartidos() {
		val DB db = dbConnector.openConnection
		val DBCollection colMatches = db.getCollection(MATCHES_COLLECTION)
		val List<Partido> partidos = ObjectMapper.fromCollectionDBOToMatches(colMatches)
		dbConnector.closeConnection
		partidos
	}

	def void insertarPartido(Partido partido) {
		val DB db = dbConnector.openConnection
		val DBCollection colJugadores = db.getCollection(MATCHES_COLLECTION)
		colJugadores.insert(ObjectMapper.fromMatchToDBObject(partido))
		dbConnector.closeConnection
	}

	def eliminarTodo() {
		println("Borrando todos los partidos de la base")
		val DB db = dbConnector.openConnection
		val DBCollection colJugadores = db.getCollection(MATCHES_COLLECTION)
		colJugadores.remove(new BasicDBObject)
		dbConnector.closeConnection
	}

}
