package com.dds.grupo4.domain

import java.util.Date

import org.uqbar.commons.utils.Observable

@Observable
class Nota {
	@Property String fecha
	@Property String descripcion
	@Property Boolean Aprobado
	
	new(String fecha, String descripcion, Boolean aprobado){
		this.fecha = fecha 
		this.descripcion = descripcion
		this.aprobado = aprobado
	}
	
	def String getFecha(){
		fecha
	}
	
	def String getDescripcion(){
		descripcion
	}
	
	def Boolean getAprobado(){
		aprobado
	}
	
//	def void setFecha(Date fecha) {
//		this._fecha = fecha
//	}
}