package ar.utn.dds

import java.util.List;
import java.awt.TexturePaintContext.Int;
import java.nio.file.DirectoryStream.Filter;
import java.security.Principal;
import java.text.SimpleDateFormat

import grails.converters.JSON
import ar.utn.dds.domain.JugadorToMatch

import com.dds.grupo4.divisorequipos.DivisorDeEquipos
import com.dds.grupo4.divisorequipos.NumerosFijos;
import com.dds.grupo4.divisorequipos.ParImpar;
import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.home.Partidos
import com.dds.grupo4.home.TodosLosJugadores;
import com.dds.grupo4.ordenamiento.CriterioOrden
import com.dds.grupo4.ordenamiento.Handicap
import com.dds.grupo4.ordenamiento.PromedioCalificaciones
import com.dds.grupo4.ordenamiento.PromedioUltimosPartidos

import org.hibernate.transform.ToListResultTransformer;
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat
import org.joda.time.LocalDate
import org.joda.time.format.DateTimeFormatter


class OrganizadorPartidosFutbolController {

	Partidos homePartidos = Partidos.instance
	TodosLosJugadores homeJugadores = TodosLosJugadores.instance

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		render(view : "list")
		redirect(action: "list", params: params)
	}

	//	def create(){
	//		render(view: "edit",model: [partidoInstance])
	//	}

	def list(Integer max){

	}

	def getPartidos(){
		def partidos = homePartidos.getPartidos().collect { partido ->
			["id" : partido.id,"fecha" : partido.fechaInicio]
		} as JSON
		render partidos
	}

	def show(Long id){
		render(view : "show", model:[_partidoId:params.partidoId])
		/*redirect(action :"getJugadoresDeUnPartdio",params:params)*/
	}

	def getJugadoresDeUnPartdio(){
		def partidoResponse = null
		if(params.partidoId){
			def partidoIdAsLong = params.partidoId as Long
			Partido partdioBuscado = homePartidos.getPartido(partidoIdAsLong)

			partidoResponse = partdioBuscado.inscripciones.collect { inscripcion ->
				[	"nombre" : inscripcion.jugador.nombre,
					"apellido":inscripcion.jugador.apellido,
					"apodo":inscripcion.jugador.apodo,
					"fechaNacimiento":inscripcion.jugador.fechaNacimiento,
					"handicap":inscripcion.jugador.handicap,
					"id" : inscripcion.jugador.id ]
			} as JSON
		}
		render partidoResponse
	}

	def mapear(partido, params) {
		if (params.partido) {
			partido.fechaInicio = params.fechaInicio
		} else {
			partido.fechaInicio = null
		}
		partido
	}

	def detalleJugador(Long id){
		render(view : "detalleJugador",model : [playerId:params.jugadorId])

	}

	def doDetalleJugador(){
		def playreId = params.jugadorId as Integer

		def jugador = homeJugadores.getJugador(playreId)

		def jugadorBuscado = [ "nombre" : jugador.nombre,"apodo" : jugador.apodo, "handicap" : jugador.handicap, "amigos": jugador.amigos.collect{ amigo ->
				["nombre": amigo.nombre , "apellido" : amigo.apellido,"fecha" : amigo.fechaFormateada,"id": amigo.id]
			} ] as JSON

		render jugadorBuscado

	}

	def generarEquipos(){

		def ordenamientos = new ArrayList()
		ordenamientos.add(params.ordenamiento1)
		ordenamientos.add(params.ordenamiento2)
		ordenamientos.add(params.ordenamiento3)

		Partido partidoAGenerar = homePartidos.getPartido((params.partidoId as Long))
		List<CriterioOrden> criterioOrden = mapearCriteriosOrden(ordenamientos)

		DivisorDeEquipos criterioSeleccion = mapearCriterioSeleccion(params.seleccion,partidoAGenerar)

		def formacion =	homePartidos.generarEquipo(partidoAGenerar,criterioOrden,criterioSeleccion)

		def formacionJson = formacion.collect { inscripcion ->
			[	"nombre" : inscripcion.jugador.nombre,
				"apellido":inscripcion.jugador.apellido,
				"apodo":inscripcion.jugador.apodo,
				"fechaNacimiento":inscripcion.jugador.fechaFormateada,
				"handicap":inscripcion.jugador.handicap,
				"id" : inscripcion.jugador.id ]
		} as JSON

		render formacionJson
	}

	def mapearCriterioSeleccion(seleccion,partido){
		DivisorDeEquipos criterio = null

		if(seleccion == "parImpar"){
			criterio = new ParImpar(partido)
		}

		if(seleccion == "numerosFijos"){
			criterio = new NumerosFijos(partido)
		}

		criterio
	}

	def mapearCriteriosOrden(ordenamiento){

		List<CriterioOrden> criterios = ordenamiento.collect { unOrden ->
			mapearUnCriterio(unOrden)
		} findAll{ orden -> orden != null} 

		criterios
	}

	def mapearUnCriterio(ordenamiento){
		CriterioOrden criterio = null

		if(ordenamiento == "handicap"){
			criterio = new Handicap()
		}

		if(ordenamiento == "calificacion"){
			criterio = new PromedioCalificaciones()
		}

		if(ordenamiento == "ultimoPartido"){
			criterio = new PromedioUltimosPartidos(2)
		}

		criterio
	}

	def busqueda(){
	}

	def buscarJugadoresAsJson(){

		def jugadorBusqueda = mapearJugador(new JugadorToMatch(), params)
		def jugadoresMatcheados = filtrarJugadores(jugadorBusqueda)
		def jugadores = jugadoresMatcheados.collect { jugador ->
			["nombre" : jugador.nombre, "apellido":jugador.apellido, "apodo":jugador.apodo
				,"fechaNacimiento":jugador.getFechaFormateada(),"handicap":jugador.handicap,"id":jugador.id]
		} as JSON
		render jugadores

	}

	def filtrarJugadores(jugadorToMatch){
		def interesadosAceptados = homeJugadores.getInteresadosAceptados()

		interesadosAceptados.findAll  { jugador  ->
			jugador.nombre.toLowerCase().startsWith(jugadorToMatch.nombre.toLowerCase()) &&
					(jugador.apodo.toLowerCase().contains(jugadorToMatch.apodo)) &&
					(jugador.fechaNacimiento.isBefore(jugadorToMatch.fechaHasta)) &&
					jugador.fechaNacimiento.isAfter(jugadorToMatch.fechaDesde) &&
					(jugador.handicap as Integer) < jugadorToMatch.handicapHasta &&
					(jugador.handicap as Integer) > jugadorToMatch.handicapDesde
		}
	}

	def paginaPrincipal(){
		render(view : "index")
	}

	def mapearJugador(jugador,params){
		def DateTimeFormatter format = DateTimeFormat.forPattern("yyyy/MM/dd")

		if(params.nombre){
			jugador.setNombre(params.nombre)
		}else{
			jugador.nombre = ""
		}
		if(params.apellido){
			jugador.apellido = params.apellido
		}else {
			jugador.apellido = ""
		}
		if(params.apodo){
			jugador.apodo = params.apodo
		}else{
			jugador.apodo = ""
		}
		if(params.handicapDesde){
			jugador.handicapDesde = params.handicapDesde as Integer
		}else{
			jugador.handicapDesde = 0 as Integer
		}
		if(params.handicapHasta){
			jugador.handicapHasta = params.handicapHasta as Integer
		}else{
			jugador.handicapHasta = 10 as Integer
		}
		if(params.fechaDesde){
			jugador.fechaDesde = format.parseDateTime(params.fechaDesde)
		}else{
			jugador.fechaDesde = format.parseDateTime("1000/01/01")
		}
		if(params.fechaHasta){
			jugador.fechaHasta = format.parseDateTime(params.fechaHasta)
		}else{
			jugador.fechaHasta = format.parseDateTime("3000/12/22")
		}

		jugador
	}


}
