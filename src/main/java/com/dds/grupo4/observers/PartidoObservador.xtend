package com.dds.grupo4.observers

import com.dds.grupo4.Partido

interface PartidoObservador {
	
	def void notificar(Partido partido)
	
}