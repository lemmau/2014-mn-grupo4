package com.dds.grupo4.service

import com.dds.grupo4.connector.DataBaseConnector
import org.joda.time.format.DateTimeFormatter
import org.joda.time.format.DateTimeFormat
import com.dds.grupo4.dominio.Partido
import com.mongodb.DB
import com.mongodb.DBCollection
import com.mongodb.BasicDBObject
import com.dds.grupo4.dominio.Admin
import com.mongodb.BasicDBList
import com.dds.grupo4.dominio.Jugador
import java.util.List
import com.dds.grupo4.ordenamiento.CriterioOrden
import com.dds.grupo4.dominio.Inscripcion
import com.dds.grupo4.dominio.Calificacion

class PartidoService {
	private final val MATCHES_COLLECTION = "partidos"
	private DataBaseConnector dbConnector
	private val DateTimeFormatter formatter = DateTimeFormat.forPattern("yyyy/MM/dd")

	new(DataBaseConnector connector) {
		dbConnector = connector
	}

	def showMatches() {
		val DB db = dbConnector.openConnection
		val DBCollection collectionPlayers = db.getCollection(MATCHES_COLLECTION)

		val cursor = collectionPlayers.find();//TODO limitar la cantidad de amigos que trae de la base

		while (cursor.hasNext) {
			println(cursor.next)
		}
		dbConnector.closeConnection
	}

	def void insertarPartido(Partido partido) {
		val DB db = dbConnector.openConnection
		val DBCollection colJugadores = db.getCollection(MATCHES_COLLECTION)
		colJugadores.insert(mapMatchesAsDbObject(partido))
		dbConnector.closeConnection
	}

	private def BasicDBObject mapMatchesAsDbObject(Partido partido) {
		return new BasicDBObject("id", partido.id).append("nombre", partido.nombre).append("fechaInicio",
			partido.fechaInicio.toString(formatter)).append("admin", mapAdmin(partido.admin)).append("equipoA",
			mapFormacion(partido.equipoA)).append("equipoB", mapFormacion(partido.equipoB)).append("jugadoresConfirmados",
			partido.jugadoresConfirmados).append("inscripciones", mapInscripciones(partido.inscripciones)).append(
			"criteriosOrden", mapCriteriosOrden(partido.criteriosOrden))
	}

	private def BasicDBList mapInscripciones(List<Inscripcion> inscripciones) {
		val dbl = new BasicDBList

		inscripciones.forEach [ inscripcion |
			new BasicDBObject("jugadorId", inscripcion.jugador.id).append("nombre", inscripcion.jugador.nombre).
				append("apellido", inscripcion.jugador.apellido).append("calificaciones",
					matchCalificaciones(inscripcion.calificaciones))
		]

		null
	}

	private def BasicDBList matchCalificaciones(List<Calificacion> calificaciones) {
		val dbl = new BasicDBList

		calificaciones.forEach[calificacion|
			dbl.add(
				new BasicDBObject("nota", calificacion.nota).append("critica", calificacion.critica)
			)]

		dbl
	}

	private def BasicDBObject mapAdmin(Admin admin) {
		new BasicDBObject("nombre", admin.nombre).append("apellido", admin.apellido).append("mail", admin.mail)
	}

	private def BasicDBList mapCriteriosOrden(List<CriterioOrden> criterios) {
		val dbl = new BasicDBList
		criterios.forEach[criterio|dbl.add(new BasicDBObject("type", criterio.toString))]
		dbl
	}

	private def BasicDBList mapFormacion(List<Jugador> jugadores) {
		val BasicDBList dbl = new BasicDBList
		jugadores.forEach[jugador|
			dbl.add(
				new BasicDBObject("nombre", jugador.nombre).append("apellido", jugador.apellido).append("handicap",
					jugador.handicap).append("id", jugador.id)
			)]
		dbl
	}

	def eliminarTodo() {

		val DB db = dbConnector.openConnection
		val DBCollection colJugadores = db.getCollection(MATCHES_COLLECTION)
		colJugadores.remove(new BasicDBObject)
		dbConnector.closeConnection
	}

}
