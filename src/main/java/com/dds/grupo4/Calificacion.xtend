package com.dds.grupo4

class Calificacion {
	
	@Property int nota
	@Property String critica
	@Property Partido partido
	@Property Interesado jugador
	
	
	new(Partido partido, Interesado jugador, int nota, String critica){
		this.partido = partido
		this.jugador = jugador
		this.nota = nota
		this.critica = critica
	}
	
	
}