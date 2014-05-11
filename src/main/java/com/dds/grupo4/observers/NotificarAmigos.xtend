package com.dds.grupo4.observers

import com.dds.grupo4.Partido
import java.util.Collection
import com.dds.grupo4.Interesado

class NotificarAmigos implements PartidoObservador{
	
	override notificar(Partido partido) {
		val Collection<Interesado> amigos = partido.getUltimoInteresadoAgregado.getAmigos
//		amigos.forEach[ amigo | amigo.notificar ]
	}
	
}