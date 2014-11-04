package com.dds.grupo4.objectMapper

import org.joda.time.format.DateTimeFormatter
import org.joda.time.format.DateTimeFormat
import com.dds.grupo4.dominio.Partido
import com.mongodb.DBCollection
import com.mongodb.BasicDBObject
import com.dds.grupo4.dominio.Admin
import com.mongodb.BasicDBList
import com.dds.grupo4.dominio.Jugador
import java.util.List
import com.dds.grupo4.ordenamiento.CriterioOrden
import com.dds.grupo4.dominio.Inscripcion
import com.dds.grupo4.dominio.Calificacion
import java.util.ArrayList
import com.mongodb.DBCursor
import com.mongodb.DBObject
import org.joda.time.DateTime
import com.dds.grupo4.tipoDeInscripcion.Condicional
import com.dds.grupo4.tipoDeInscripcion.Solidario
import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion
import com.dds.grupo4.dominio.Infraccion
import org.joda.time.LocalDateTime
import java.util.Iterator
import com.dds.grupo4.ordenamiento.Handicap
import com.dds.grupo4.ordenamiento.PromedioCalificaciones
import com.dds.grupo4.ordenamiento.PromedioUltimasCalificaciones
import com.dds.grupo4.ordenamiento.PromedioUltimosPartidos
import com.dds.grupo4.dominio.Denegacion

class ObjectMapper {

	private static val DateTimeFormatter formatter = DateTimeFormat.forPattern("yyyy/MM/dd")

	/*******************************************************************************
	 * Mapeo para partidos - Es muy cabeza esto - Se debe bajar un pluggin o hacer por reflection
	 ******************************************************************************/
	static def List<Partido> fromCollectionDBOToMatches(DBCollection colMatches) {
		val DBCursor cursor = colMatches.find
		buildMatchesFromCursor(cursor)
	}

	static def List<Partido> buildMatchesFromCursor(DBCursor cursorMatch) {
		val List<Partido> partidos = new ArrayList

		while (cursorMatch.hasNext) {
			val DBObject partidoObject = cursorMatch.next
			val Partido partido = convertFromDBObjectToMatch(partidoObject)
			partidos.add(partido)
		}

		partidos
	}

	private static def Partido convertFromDBObjectToMatch(DBObject objectMatch) {

		val Admin admin = new Admin((objectMatch.get("admin") as DBObject).get("mail").toString)
		admin.setNombre((objectMatch.get("admin") as DBObject).get("nombre").toString)
		admin.setApellido((objectMatch.get("admin") as DBObject).get("apellido").toString)

		val Partido partido = new Partido(admin)
		partido.setId(new Long(objectMatch.get("id").toString))
		partido.setNombre(objectMatch.get("nombre").toString)
		partido.setFechaInicio(new DateTime(objectMatch.get("fechaInicio").toString.replace("/", "-")))
		partido.setEquipoA(transformObjectsAsPLayers(objectMatch.get("equipoA") as BasicDBList))
		partido.setEquipoB(transformObjectsAsPLayers(objectMatch.get("equipoB") as BasicDBList))
		partido.setInscripciones(fromObjectToInscripciones(objectMatch.get("inscripciones") as BasicDBList))
		partido.setJugadoresConfirmados(
			fromObjectToInscripciones(objectMatch.get("jugadoresConfirmados") as BasicDBList))
		partido.setCriteriosOrden(fromObjectToCriteriosDeOrden(objectMatch.get("criteriosOrden") as BasicDBList))

		partido
	}

	private static def List<CriterioOrden> fromObjectToCriteriosDeOrden(BasicDBList criteriosdblist) {
		val List<CriterioOrden> criterios = new ArrayList

		val Iterator<Object> fields = criteriosdblist.iterator

		while (fields.hasNext) {
			val BasicDBObject criterioObject = fields.next as BasicDBObject

			criterios.add(
				switch criterioObject.get("type").toString {
					case "handicap": new Handicap
					case "promedioCalificacion": new PromedioCalificaciones
					case "promedioUltimasCalificaciones": new PromedioUltimasCalificaciones
					case "promediosUltimosPartidos": new PromedioUltimosPartidos
				})
		}

		criterios
	}

	private static def List<Inscripcion> fromObjectToInscripciones(BasicDBList inscripcionesDBList) {
		val List<Inscripcion> inscripciones = new ArrayList
		val Iterator<Object> fields = inscripcionesDBList.iterator

		while (fields.hasNext) {
			val BasicDBObject inscripcionObject = fields.next as BasicDBObject
			val Jugador jugador = convertFromDBObjectToJugador(inscripcionObject.get("jugador") as BasicDBObject, true)
			val List<Calificacion> calificaciones = fromObjectToCalificaciones(
				inscripcionObject.get("calificaciones") as BasicDBList)

			inscripciones.add(new Inscripcion(jugador, calificaciones))

		}
		inscripciones
	}

	private static def List<Calificacion> fromObjectToCalificaciones(BasicDBList calificacionesObjectList) {
		val List<Calificacion> calificaciones = new ArrayList

		val Iterator<Object> fields = calificacionesObjectList.iterator

		while (fields.hasNext) {
			val BasicDBObject calificacionObj = fields.next as BasicDBObject
			val Calificacion calificacion = convertFromDBObjectToCalificacion(calificacionObj)

			calificaciones.add(calificacion)
		}
		calificaciones
	}

	private static def Calificacion convertFromDBObjectToCalificacion(BasicDBObject objectCalificacion) {
		new Calificacion(new Integer(objectCalificacion.get("nota").toString),
			objectCalificacion.get("critica").toString)
	}

	static def BasicDBObject fromMatchToDBObject(Partido partido) {
		return new BasicDBObject("id", partido.id).append("nombre", partido.nombre).append("fechaInicio",
			partido.fechaInicio.toString(formatter)).append("admin", mapAdmin(partido.admin)).append("equipoA",
			mapFormacion(partido.equipoA)).append("equipoB", mapFormacion(partido.equipoB)).append("jugadoresConfirmados",
			mapInscripciones(partido.jugadoresConfirmados)).append("inscripciones", mapInscripciones(partido.inscripciones)).
			append("criteriosOrden", mapCriteriosOrden(partido.criteriosOrden))
	}

	private static def BasicDBList mapInscripciones(List<Inscripcion> inscripciones) {
		val dbl = new BasicDBList

		inscripciones.forEach [ inscripcion |
			dbl.add(
				new BasicDBObject("jugador",
					new BasicDBObject("id", inscripcion.jugador.id).append("nombre", inscripcion.jugador.nombre).
						append("apodo", inscripcion.jugador.apodo).append("fechaNacimiento",
							inscripcion.jugador.fechaNacimiento.toString(formatter)).append("apellido",
							inscripcion.jugador.apellido).append("handicap", inscripcion.jugador.handicap)).append("calificaciones",
					matchCalificaciones(inscripcion.calificaciones)))
		]
		dbl
	}

	private static def BasicDBList matchCalificaciones(List<Calificacion> calificaciones) {
		val dbl = new BasicDBList

		calificaciones.forEach[calificacion|
			dbl.add(
				new BasicDBObject("nota", calificacion.nota).append("critica", calificacion.critica)
			)]

		dbl
	}

	private static def BasicDBObject mapAdmin(Admin admin) {
		new BasicDBObject("nombre", admin.nombre).append("apellido", admin.apellido).append("mail", admin.mail)
	}

	private static def BasicDBList mapCriteriosOrden(List<CriterioOrden> criterios) {
		val dbl = new BasicDBList
		criterios.forEach[criterio|dbl.add(new BasicDBObject("type", criterio.toString))]
		dbl
	}

	private static def BasicDBList mapFormacion(List<Jugador> jugadores) {
		val BasicDBList dbl = new BasicDBList
		jugadores.forEach[jugador|
			dbl.add(
				new BasicDBObject("nombre", jugador.nombre).append("fechaNacimiento",jugador.fechaNacimiento.toString(formatter)).append("apodo",jugador.apodo).append("apellido", jugador.apellido).append("handicap",
					jugador.handicap).append("id", jugador.id)
			)]
		dbl
	}

	/*******************************************************************************
	 * Mapeo para jugadores - Es muy cabeza esto - Se debe bajar un pluggin o hacer por reflection
	 ******************************************************************************/
	static def List<Jugador> transformObjectsAsPLayers(BasicDBList playersDBList) {
		val List<Jugador> jugadores = new ArrayList

		val Iterator<Object> fields = playersDBList.iterator

		while (fields.hasNext) {
			val BasicDBObject jugadorObj = fields.next as BasicDBObject
			val Jugador jugador = convertFromDBObjectToJugador(jugadorObj, true)

			jugadores.add(jugador)

		}

		jugadores
	}

	static def List<Jugador> transformObjectsAsPLayers(DBCursor playersObjectCursor) {
		val List<Jugador> jugadores = new ArrayList

		while (playersObjectCursor.hasNext) {
			val DBObject jugadorObject = playersObjectCursor.next
			val Jugador jugador = convertFromDBObjectToJugador(jugadorObject, false)
			jugadores.add(jugador)
		}
		jugadores
	}

	static def Jugador convertFromDBObjectToJugador(DBObject jugadorObject, boolean partial) {
		val Jugador jugador = new Jugador

		jugador.setNombre(jugadorObject.get("nombre").toString)
		jugador.setApellido(jugadorObject.get("apellido").toString)
		jugador.setHandicap(jugadorObject.get("handicap") as Integer)
		jugador.setId(new Long(jugadorObject.get("id").toString))
		jugador.setApodo(jugadorObject.get("apodo").toString)
		jugador.setFechaNacimiento(new DateTime(jugadorObject.get("fechaNacimiento").toString.replace("/", "-")))

		if (!partial) {
			jugador.setTipoDeInscripcion(mapInscripcionFromString(jugadorObject))
			jugador.setAmigos(convertAmigosObjectToPlayers(jugadorObject.get("amigos") as BasicDBList))
			jugador.setInfracciones(mapInfraccionesFromObject(jugadorObject.get("infracciones") as BasicDBList))
		}

		jugador
	}

	private def static List<Jugador> convertAmigosObjectToPlayers(BasicDBList amigos) {
		val Iterator<Object> iterator = amigos.iterator
		val List<Jugador> amigosTransformed = new ArrayList

		while (iterator.hasNext) {
			val BasicDBObject amigo = iterator.next as BasicDBObject

			amigosTransformed.add(convertFromDBObjectToJugador(amigo,true))
		}
		
		amigosTransformed
	}

	private static def List<Infraccion> mapInfraccionesFromObject(BasicDBList infraccionesObject) {
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

	private static def TipoDeInscripcion mapInscripcionFromString(DBObject playerObject) {
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

	static def BasicDBObject mapPlayerAsDbObject(Jugador jugador) {

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

	private static def BasicDBList mapPartidosDeUnJugador(List<Partido> partidos) {
		val BasicDBList dbl = new BasicDBList
		partidos.forEach[partido|dbl.add(new BasicDBObject("id", partido.id))]
		dbl
	}

	private static def BasicDBList mapInfracciones(List<Infraccion> infracciones) {
		val BasicDBList dbl = new BasicDBList
		infracciones.forEach[infraccion|
			dbl.add(new BasicDBObject("motivo", infraccion.motivo).append("fecha", infraccion.fecha.toString(formatter)))]
		dbl
	}

	static def BasicDBObject mapPlayerToDenegatePlayerObject(Denegacion denegacion) {
		new BasicDBObject("motivo", denegacion.motivo).append("fecha", denegacion.fecha.toString(formatter)).
			append("jugadorId", denegacion.interesado.id)

	}

	private static def BasicDBList mapPlayersFriend(List<Jugador> amigos) {
		val BasicDBList dbl = new BasicDBList
		amigos.forEach[amigo|
			dbl.add(
				new BasicDBObject("nombre", amigo.nombre).append("apodo",amigo.apodo).append("apellido", amigo.apellido).append("handicap",
					amigo.handicap).append("fechaNacimiento", amigo.fechaNacimiento.toString(formatter)).append("id",
					amigo.id)
			)]
		dbl
	}

}
