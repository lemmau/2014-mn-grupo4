package com.dds.grupo4.service

import com.mongodb.DB
import com.dds.grupo4.dominio.Jugador
import com.mongodb.BasicDBObject
import java.util.List
import com.mongodb.DBCollection
import com.dds.grupo4.connector.DataBaseConnector
import com.mongodb.WriteResult
import com.dds.grupo4.dominio.Denegacion
import com.mongodb.DBObject
import com.dds.grupo4.objectMapper.ObjectMapper
import java.util.ArrayList

class JugadoresService {
	private val List<Jugador> jugadoresAceptadosCache = new ArrayList
	public static val ACCEPTED_PLAYERS = "jugadoresAceptados"
	public static val OUTSTANDING_PLAYERS = "jugadoresPendientes"
	public static val REJECTED_PLAYERS = "jugadoresRechazados"
	private DataBaseConnector dbConnector

	new(DataBaseConnector connector) {
		dbConnector = connector
	}

	def void insertPlayer(Jugador jugador, String coleccion) {
		val DB db = dbConnector.openConnection
		val DBCollection colJugadores = db.getCollection(coleccion)
		colJugadores.insert(ObjectMapper.mapPlayerAsDbObject(jugador))
		dbConnector.closeConnection
	}
	
	def List<Jugador> getPlayers(List<Long> ids){
		val List<Jugador> jugadores = new ArrayList
		ids.forEach[ id | jugadores.add(getPlayer(id,ACCEPTED_PLAYERS))]
		jugadores
	}

	def void agregarJugadorDenegado(Denegacion denegacion) {
		val DB db = dbConnector.openConnection
		val DBCollection colJugadores = db.getCollection(REJECTED_PLAYERS)
		colJugadores.insert(ObjectMapper.mapPlayerToDenegatePlayerObject(denegacion))
		dbConnector.closeConnection
	}

	def Jugador getPlayer(Long id, String coleccion) {
		val DB db = dbConnector.openConnection
		val DBCollection colJugadores = db.getCollection(coleccion)
		val Jugador jugadorBuscado = ObjectMapper.convertFromDBObjectToJugador(
			colJugadores.findOne(new BasicDBObject("id", id)), false)
		dbConnector.closeConnection
		println(jugadorBuscado.tipoDeInscripcion.class.toString)
		jugadorBuscado
	}

	def List<Jugador> getAllPlayers(String coleccion) {
		val DB db = dbConnector.openConnection
		val DBCollection colJugadores = db.getCollection(coleccion)
		val List<Jugador> jugadores = ObjectMapper.transformObjectsAsPLayers(colJugadores.find)
		dbConnector.closeConnection
		jugadores
	}

	def Integer cantidadInteresadosRechazados() {
		val DB db = dbConnector.openConnection
		val Integer cantidad = db.getCollection(REJECTED_PLAYERS).find().size
		dbConnector.closeConnection
		cantidad
	}

	def eliminarTodosLosJugadores(String coleccion) {
		val DB db = dbConnector.openConnection
		val DBCollection colJugadores = db.getCollection(coleccion)
		colJugadores.remove(new BasicDBObject)
		dbConnector.closeConnection
	}

	def boolean remove(Jugador jugador, String coleccion) {
		var boolean deleted = false
		val DB db = dbConnector.openConnection
		val DBCollection colJugadores = db.getCollection(coleccion)
		val WriteResult wr = colJugadores.remove(new BasicDBObject("id", jugador.id))
		dbConnector.closeConnection
		if (wr.n == 1) {
			deleted = true
		}
		deleted
	}

	def boolean existe(Jugador jugador, String coleccion) {
		var boolean exist = false
		val jugadorResultado = getPlayer(jugador.id, coleccion)

		if (jugadorResultado.id == jugador.id) {
			exist = true
		}
		exist
	}

	def boolean esUnRechazado(Jugador interesado) {
		val DB db = dbConnector.openConnection
		val DBObject rechazado = db.getCollection(REJECTED_PLAYERS).findOne(
			new BasicDBObject("jugadorId", interesado.id))
		dbConnector.closeConnection
		if (rechazado.get("jugadorId") as Long == interesado.id) {
			return true
		} else {
			false
		}
	}

	def showPlayers(String coleccion) {
		val DB db = dbConnector.openConnection
		val DBCollection collectionPlayers = db.getCollection(coleccion)

		val cursor = collectionPlayers.find

		while (cursor.hasNext) {
			println(cursor.next)
		}
		dbConnector.closeConnection
	}

}
