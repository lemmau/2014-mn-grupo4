package com.dds.grupo4

class Calificacion {

	@Property int nota
	@Property String critica

	new( int nota, String critica) {
		this.nota = nota
		this.critica = critica
	}

}
