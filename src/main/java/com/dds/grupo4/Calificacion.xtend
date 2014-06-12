package com.dds.grupo4

class Calificacion {

	@Property int nota
	@Property String critica
	@Property Partido partido

	new(Partido partido, int nota, String critica) {
		this.partido = partido
		this.nota = nota
		this.critica = critica
	}

	new(int nota, String critica) {
		this( null, nota, critica)
	}

}
