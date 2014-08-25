package com.dds.grupo4.domain


import org.uqbar.commons.utils.Observable
import java.util.Date

@Observable
class Nota {
	@Property Date fecha
	@Property String descripcion
	@Property Boolean aprobado

	new(Date fecha, String descripcion, Boolean aprobado){
		this.fecha = fecha 
		this.descripcion = descripcion
		this.aprobado = aprobado
	}

	new() {
		this(null,"",false)
	}
	
//	def String getFecha(){
//		_fecha
//	}
	
	def String getDescripcion(){
		_descripcion
	}
	
	def Boolean getAprobado(){
		_aprobado
	}

}