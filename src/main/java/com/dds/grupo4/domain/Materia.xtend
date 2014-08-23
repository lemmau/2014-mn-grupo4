package com.dds.grupo4.domain

import org.uqbar.commons.utils.Observable
import java.util.List
import java.util.ArrayList

@Observable
class Materia {
	@Property String nombre
	@Property String ubicacion
	@Property Integer anioCursada
	@Property String profesor
	@Property Boolean finalAprobado
	@Property List<Nota> notas

	new() {}
	
	new(String nombre, String ubicacion, Integer anioCursada, String profesor, Boolean finalAprobado  ){
		this.nombre = nombre
		this.ubicacion = ubicacion
		this.anioCursada = anioCursada
		this.profesor = profesor
		this.finalAprobado = finalAprobado
		notas = new ArrayList<Nota>
	}
	
	new(String nombre) {
		this.nombre = nombre
		this.anioCursada = 2014
		this.finalAprobado = true
	}
	


	def String getNombre(){
		_nombre
	}
	
	def String getUbicacion(){
		_ubicacion
	}

	def Integer getAnioCursada(){
		_anioCursada
	}
	
	def String getProfesor(){
		_profesor
	}

	def Boolean getFinalAprobado(){
		_finalAprobado
	}
		
	def copy() {
		super.clone as Materia
	}
	
	// limpieza de campos del form
	def void clear() {
		nombre = null
		ubicacion = null
		anioCursada = null
		profesor = null
		finalAprobado = null
		notas = new ArrayList<Nota>
	}

	override toString(){
		_nombre
	}
	
	def agregarNota(Nota nota) {
		notas.add(nota)
	}
	
}