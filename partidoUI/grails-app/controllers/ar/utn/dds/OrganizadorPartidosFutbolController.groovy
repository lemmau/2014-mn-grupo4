package ar.utn.dds

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
		redirect(action: "list", params: params)
	}

	//	def create(){
	//		render(view: "edit",model: [partidoInstance])
	//	}

	def list(Integer max){

		def partido = mapear(new Partido(), params)
		def partidos = homePartidos.getPartidos()
		[partidoInstanceList: partidos, partidoInstanceTotal: partidos.size()]
	}

	def show(Long id){
		def partido = homePartidos.getPartido(id)
		if (!partido) {
			flash.message = "partido " + id + " no encontrado"
			redirect(action: "list")
		}
		else {
			println("el partido es:" + partido.id)
			[partidoInstance: partido]
		}

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
			println("los amigos son" + jugador._amigos.toListString())
			[jugadorInstance: jugador, amigosInstance: jugador.amigos]
		}
	}

	def generarEquipos(){

	}

	def busqueda(){
		println("los params son:" + params)
		def jugadorBusqueda = mapearJugador(new Jugador(), params)
		def jugadores = homeJugadores.getJugadores(jugadorBusqueda)
		render(view: "busqueda", model: [jugadoresInstanceList: jugadores,jugadorBusqueda: jugadorBusqueda])
	}
	
	
	/*def buscar(){
		redirect(action: "busquedaInterna", params: params)
	}*/
	
	/*def busquedaInterna(){
		println("los params son:" + params)
		def jugadorBusqueda = mapearJugador(new Jugador(), params)
		def jugadores = homeJugadores.getJugadores(jugadorBusqueda)
		[jugadoresInstanceList: jugadores, jugadorBusqueda: jugadorBusqueda]
	}*/

	def mapearJugador(jugador,params){
		if(params.nombre){
			jugador.nombre = params.nombre
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
