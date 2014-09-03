package ar.utn.dds

import com.google.common.base.Function
import ar.utn.dds.exceptions.BusinessException
import ar.utn.dds.exceptions.SystemException
import ar.utn.dds.home.pruebaConcepto.HomeMateria;
import ar.utn.dds.pruebaConcepto.Materia
import ar.utn.dds.pruebaConcepto.Nota



class PruebaConceptoController {
	
	HomeMateria homeMaterias = HomeMateria.instance

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
    def index() { 
		redirect(action: "list", params: params)
	}

	def list(Integer max){
		
		def materia = mapear(new Materia(), params)
		def materias = homeMaterias.getMaterias(materia)
		[materiaInstanceList: materias, materiaInstanceTotal: materias.size(), materia: materia ]
	}

	def create() {
		render(view: "edit", model: [materiaInstance: mapear(new Materia(), params), alta: true])
	}
	
	def save() {
		def materiaInstance = null
		def defaultMessage = null
		def id = params.id ? params.id as Long : null
		if (id) {
			materiaInstance = homeMaterias.getMateria(id)
			defaultMessage = "La materia se actualizó correctamente"
		} else {
			materiaInstance = new Materia()
			defaultMessage = "La materia se generó correctamente"
		}
		try {
			mapear(materiaInstance, params)
			homeMaterias.actualizarMateria(materiaInstance)
			flash.message = defaultMessage
			redirect(action: "list")
		} catch (BusinessException e) {
			this.handleEditionError(materiaInstance, e)
		} catch (Exception e) {
			this.handleEditionError(materiaInstance, new SystemException("Ha ocurrido un error. Consulte al administrador"))
		}
	}
	
	def handleEditionError(materia, exception) {
		render(view: "edit", model: [materiaInstance: materia, alta: materia.id == null, exception: exception])
	}
	
	
//	def mapear(materia, params) {
//		if (params.nombre) {
//			materia.nombre = params.nombre
//		} else {
//			materia.nombre = null
//		}
//		if (params.ubicacion) {
//			materia.ubicacion = params.ubicacion
//		} else {
//			materia.ubicacion = null
//		}
//		if (params.anioCursada) {
//			materia.anioCursada = new Integer(params.anioCursada)
//		} else {
//			materia.anioCursada = null
//		}
//		if (params.profesor) {
//			materia.profesor = params.profesor
//		} else {
//			materia.profesor = null
//		}
//		if (params.finalAprobado) {
//			materia.finalAprobado = params.finalAProbado
//		} else {
//			materia.finalAprobado = false
//		}
//		if (params.notas) {
//			materia.notas = params.notas
//		}
//		materia
//	}
	
	def mapear(materia, params) {
		if (params.materia) {
			materia.nombre = params.materia
		} else {
			materia.nombre = ""
		}
		if (params.ubicacion) {
			materia.ubicacion = params.ubicacion
		} else {
			materia.ubicacion = null
		}
		if (params.anioCursada) {
			materia.anioCursada = new Integer(params.anioCursada)
		} else {
			materia.anioCursada = null
		}
		if (params.profesor) {
			materia.profesor = params.profesor
		} else {
			materia.profesor = ""
		}
		if (params.finalAprobado) {
			materia.finalAprobado = params.finalAProbado
		} else {
			materia.finalAprobado = false
		}
		if (params.notas) {
			materia.notas = params.notas
		}
		materia
	}
}
