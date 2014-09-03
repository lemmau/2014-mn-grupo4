package ar.utn.dds.pruebaConcepto

import java.util.List
import java.util.ArrayList
import java.util.Date
import ar.utn.dds.exceptions.BusinessException

class Materia implements Cloneable {
	
	@Property Long id
	@Property String nombre
	@Property String ubicacion
	@Property Integer anioCursada
	@Property String profesor
	@Property Boolean finalAprobado
	@Property List<Nota> notas

	new() {
		nombre = ""
		ubicacion = ""
		profesor = ""
		anioCursada = Integer.valueOf(0)	
	}

	new(String nombre, String ubicacion, Integer anioCursada, String profesor, Boolean finalAprobado) {
		this.nombre = nombre
		this.ubicacion = ubicacion
		this.anioCursada = anioCursada
		this.profesor = profesor
		this.finalAprobado = finalAprobado
		notas = new ArrayList<Nota>
	}
	
	def actualizarCon(Materia materia) {
		this.nombre = materia.nombre
		this.ubicacion = materia.ubicacion
		this.anioCursada = materia.anioCursada
		this.profesor = materia.profesor
		this.finalAprobado = materia.finalAprobado
		
	}

	def void validar() {
		if (nombre == null || nombre.equals("")) {
			throw new BusinessException("nombre", "Debe completar el nombre de la materia")
		}
		if (ubicacion == null || ubicacion.equals("")) {
			throw new BusinessException("ubicacion", "Debe completar la ubicacion")
		}
		if (profesor == null || profesor.equals("")) {
			throw new BusinessException("profesor", "Debe el nombre del profesor")
		}
		if (anioCursada == null) {
			throw new BusinessException("anioCursada", "Debe completar el año de cursada")
		} else {
			if (anioCursada > new Date().year + 1900) {
				throw new BusinessException("anioPublicacion", "El año de cursada no puede ser posterior al año actual")
			}
		}
	}

	def String getNombre() {
		_nombre
	}

	def String getUbicacion() {
		_ubicacion
	}

	def Integer getAnioCursada() {
		_anioCursada
	}

	def String getProfesor() {
		_profesor
	}

	def Boolean getFinalAprobado() {
		_finalAprobado
	}

	def copy() {
		super.clone as Materia
	}

	override toString() {
		_nombre
	}

	def agregarNota(Nota nota) {
		notas.add(nota)
	}

	def eliminarNota(Nota nota) {
		notas.remove(nota)
	}
}
