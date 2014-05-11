package com.dds.grupo4

import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion
import java.util.List
import java.util.Random

class Interesado {

	@Property private Integer edad;
	@Property private String nombre;
	@Property private String apellido;
	@Property private String mail;
	@Property private List<Interesado> amigos;
	@Property private TipoDeInscripcion tipoDeInscripcion;
	@Property private Infraccion infracciones

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
	
	def Interesado getReemplazante(){
		val int cantidadAmigos = this.amigos.size
		var Interesado reemplazante;
		
		if (cantidadAmigos > 0){
			val random = new Random();	
			reemplazante = this.amigos.get(random.nextInt(cantidadAmigos))
		}else{
			throw new RuntimeException("No tiene amigos de reemplazo")
		}
		
		return reemplazante
	}
	
}
