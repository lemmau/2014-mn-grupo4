package com.dds.grupo4.domain

import org.uqbar.commons.utils.Observable

@Observable
class Materia {
	@Property String nombre
	@Property String ubicacion
	@Property Integer anioCursada
	@Property String profesor
	@Property Boolean finalAprobado

	new(String nombre, String ubicacion, Integer anioCursada, String profesor, Boolean finalAprobado  ){
		this.nombre = nombre
		this.ubicacion = ubicacion
		this.anioCursada = anioCursada
		this.profesor = profesor
		this.finalAprobado = finalAprobado
	}
	
	def String getNombre(){
		nombre
	}
	
	def String getUbicacion(){
		ubicacion
	}

	def Integer getAnioCursada(){
		anioCursada
	}
	
	def String getProfesor(){
		profesor
	}

	def Boolean getFinalAprobado(){
		finalAprobado
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
	}
	
}