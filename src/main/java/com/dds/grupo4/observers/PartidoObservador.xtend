package com.dds.grupo4.observers

import com.dds.grupo4.Partido
import com.dds.grupo4.Interesado

interface PartidoObservador {
	
	def void notificar(Partido partido, Interesado interesado)
	
}