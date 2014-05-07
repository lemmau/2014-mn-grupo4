package com.dds.grupo4

import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion
import java.util.List

class Interesado {

	@Property private Integer edad;
	@Property private String nombre;
	@Property private String apellido;
	@Property private TipoDeInscripcion tipoDeInscripcion;

	new(String nombre, String apellido, Integer edad, TipoDeInscripcion tipoDeInscripcion) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.edad = edad;
		this.tipoDeInscripcion = tipoDeInscripcion;
	}

	def void inscribite(Partido partido) {
		this.tipoDeInscripcion.inscribime(this, partido);
	}

	def void cambiarTipoDeInscripcion(TipoDeInscripcion inscripcion) {
		this.tipoDeInscripcion = inscripcion;
	}
	
	def Boolean sosEstandar(){
		return this.tipoDeInscripcion.sosEstandar
	}
	
	def (List<Interesado>) => Boolean condicionDelPartido(){
		return this.tipoDeInscripcion.getCondicionDelPartido;
	}
	
}
