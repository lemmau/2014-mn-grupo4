package ar.utn.dds

import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.home.Partidos
import com.dds.grupo4.home.TodosLosJugadores
import com.dds.grupo4.dominio.Jugador

class OrganizadorPartidosFutbolController {

      	Partidos homePartidos = Partidos.instance
		TodosLosJugadores homeJugadores = TodosLosJugadores.instance
		
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
//    def index() { 
//		//redirect(action: "list", params: params)
//	}

	def create(){
		render(view: "edit",model: [partidoInstance])
	}
	
	def busquedaDeJugadores(Integer max){
		
		def partido = mapear(new Partido(), params)
		def partidos = homePartidos.getPartidos()
		println("incripciones: "+partidos.get(0).inscripciones)
		[partidoInstanceList: partidos, partidoInstanceTotal: partidos.size(), partidoInstance: partidos.get(0),inscripciones: partidos.get(0).inscripciones ]
	}
	
	def show(Long id) {
		def jugadorInstance = homeJugadores.getJugador(id)
		if (!jugadorInstance) {
			flash.message = "Jugador " + id + " no encontrado"
			redirect(action: "busquedaDeJugadores")
		}
		else {
			[jugadorInstance: jugadorInstance]
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
	
	
}
