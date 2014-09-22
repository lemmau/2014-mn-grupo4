package ar.utn.dds

import grails.converters.JSON
import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.home.Partidos
import com.dds.grupo4.home.TodosLosJugadores;
import org.joda.time.DateTime


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
		println("Entrando a show :" + params.partidoId)
		render(view : "show", model:[partidoIdInstance:params.partidoId])
		/*redirect(action :"getJugadoresDeUnPartdio",params:params)*/
	}

	def getJugadoresDeUnPartdio(){
		def partidoResponse = null
		if(params.partidoId){
			println("Obtuvimos el id del partido: " + params.partidoId)
			def partidoIdAsLong = params.partidoId as Long
			Partido partdioBuscado = homePartidos.getPartido(partidoIdAsLong)
			
			partidoResponse = partdioBuscado.inscripciones.collect { inscripcion ->
				["nombre" : inscripcion.jugador.nombre, "apellido":inscripcion.jugador.apellido,
					 "apodo":inscripcion.jugador.apodo
					,"fechaNacimiento":inscripcion.jugador.fechaNacimiento,
					"handicap":inscripcion.jugador.handicap]
			} as JSON
		}
		println("jsonResponse: " + partidoResponse)
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
		def jugador = homeJugadores.getJugador(id)
		if (!jugador) {
			flash.message = "Jugador " + id + " no encontrado"
			redirect(action: "show")
		}
		else {
			[jugadorInstance: jugador, amigosInstance: jugador.amigos]
		}
	}

	def generarEquipos(){

	}

	def busqueda(){
	}

	def buscarJugadoresAsJson(){
		def jugadorBusqueda = mapearJugador(new Jugador(), params)
		def jugadores = homeJugadores.getJugadores(jugadorBusqueda).collect { jugador ->
			["nombre" : jugador.nombre, "apellido":jugador.apellido, "apodo":jugador.apodo
				,"fechaNacimiento":jugador.fechaNacimiento,"handicap":jugador.handicap]
		} as JSON
		render jugadores

	}

	def paginaPrincipal(){
		render(view : "index")
	}

	def mapearJugador(jugador,params){
		if(params.nombre){
			jugador.nombre = params.nombre.capitalize()
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
		/*if(params.handicap){
		 jugador.handicap = params.handicap
		 }else{
		 jugador.handicap = 0;
		 }*/
		/*if(params.fechaNacimiento){
		 jugador.fechaNacimiento = params.fechaNacimiento
		 }else{
		 jugador.fechaNacimiento = new DateTime(0,0,0,0)
		 }
		 if(params.handicap){
		 jugador.handicap = params.handicap
		 }else{*/

		jugador
	}

}
