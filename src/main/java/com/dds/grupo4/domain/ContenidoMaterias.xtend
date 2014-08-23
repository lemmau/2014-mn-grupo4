package com.dds.grupo4.domain

import org.uqbar.commons.utils.Observable

@Observable
abstract class ContenidoMaterias {
	def String getNombre()
}

class MillasAKmConversion extends ContenidoMaterias {
	override getNombre() { "Ingenieria y Sociedad" }
}

class KmAMillasConversion extends ContenidoMaterias {
	override getNombre() { "Sistemas y Organizaciones" }
}

class OnzaAGramosConversion extends ContenidoMaterias {
	override getNombre() { "Matematica Discreta" }
}

class GramosAOnzaConversion extends ContenidoMaterias {
	override getNombre() { "Algoritmos y Estructuras de Datos" }
}