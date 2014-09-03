package ar.utn.dds.pruebaConcepto

import java.util.Date

class Nota {

		@Property Date fecha
		@Property String descripcion
		@Property Boolean aprobado

		new(Date fecha, String descripcion, Boolean aprobado) {
			this.fecha = fecha
			this.descripcion = descripcion
			this.aprobado = aprobado
		}

	
	def String getDescripcion() {
			_descripcion
		}

		def Boolean getAprobado() {
			_aprobado
		}
	}