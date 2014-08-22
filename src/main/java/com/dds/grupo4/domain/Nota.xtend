package com.dds.grupo4.domain

import java.util.Date

import org.uqbar.commons.utils.Observable

@Observable
class Nota {
	@Property Date fecha
	@Property String descripcion
	@Property Boolean Aprobado
	
//	def void setFecha(Date fecha) {
//		this._fecha = fecha
//	}
}