package com.dds.grupo4.domain


import org.uqbar.commons.utils.Observable

@Observable
class Nota {
	@Property String fecha
	@Property String descripcion
	@Property Boolean aprobado
	
	new(String fecha, String descripcion, Boolean aprobado){
		this.fecha = fecha 
		this.descripcion = descripcion
		this.aprobado = aprobado
	}
	
	new() {
		
	}
	
	def String getFecha(){
		_fecha
	}
	
	def String getDescripcion(){
		_descripcion
	}
	
	def Boolean getAprobado(){
		_aprobado
	}

}